#sideonly client
#reloadable
#priority -1500
#modloaded zenutils ctintegration

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import mods.ctintegration.util.ArrayUtil;
import mods.zenutils.NetworkHandler;
import mods.zenutils.StaticString;
import mods.zenutils.StringList;
import scripts.commands.perf.loaders.message;
import scripts.commands.perf.loaders.tpMessage;

NetworkHandler.registerServer2ClientMessage('perf_chunks', function(player, byteBuf) {
  show(byteBuf.readData());
});

function show(data as IData) as void {
  utils.log('🌍 received data from server:\n'~data);

  // Gathering stats
  var totalChunksLoaded = 0;
  var totalPlayerLoaded = 0;

  val messenger = Messenger();

  for worldData in data.worlds.asList() {
    if (isNull(worldData)) continue;
    val dim = worldData.dim.asInt();
    val chunkArr = worldData.chunks.asIntArray();
    val playerArr = worldData.players.asIntArray();

    messenger.setWorldData(dim, worldData.anchors, worldData.claims, data.titles.asList());

    // Get sorted chunk data
    val groups = getGroups(chunkArr, playerArr, data.viewDistance);

    for group in groups {
      if(utils.DEBUG) {
        var s = '';
        for c in group {s~=c~' ';}
        print('🌍 Group: '~s);
      }

      val minMax = [2147483647, 2147483647, -2147483646, -2147483646] as int[];

      // Iterate each group element to find boundaries
      for index in group {
        minMaxing(minMax, chunkArr[index*2], chunkArr[index*2+1]);
      }
      utils.log('🌍 minMax: '~ minMax[0]~' '~minMax[1]~' '~minMax[2]~' '~minMax[3]);
      val width = minMax[2] - minMax[0] + 1;
      val height = minMax[3] - minMax[1] + 1;
      utils.log('🌍 width: '~width~' height: '~height);

      // Pack closest chunks together in straightened 2d array
      val pack = intArrayOf(width * height, -1);
      for index in group {
        pack[(chunkArr[index*2] - minMax[0]) + (chunkArr[index*2+1] - minMax[1]) * width] = index;
      }

      // Compose for message
      messenger.pushGroup(pack, width, chunkArr);
    }
  }

  messenger.flush();
}

function getGroups(chunks as int[], players as int[], viewDistance as int) as int[][] {
  // Gather "score" of chunks - how many and how close other chuns are
  val chunkCount = chunks.length / 2;
  val neighbours = intArrayOf(chunkCount, -1);
  for i in 0 .. chunkCount {
    val x1 = chunks[i*2];
    val z1 = chunks[i*2+1];

    // Skip if chunk loaded by player
    var isPlayerLoaded = false;
    if (players.length > 0) {
      for k in 0 .. players.length / 2 {
        if (isClose(x1, z1, players[k*2], players[k*2+1], viewDistance)) {
          isPlayerLoaded = true;
          break;
        }
      }
    }
    if (isPlayerLoaded) continue;
    neighbours[i] = 0;

    // Summarize scores for each chunk
    for j in 0 .. chunkCount {
      if (i == j) continue;
      val x2 = chunks[j*2];
      val z2 = chunks[j*2+1];
      if (isClose(x1, z1, x2, z2, 28 / 2)) {
        val dist = pow((pow(x2 - x1, 2) + pow(z2 - z1, 2)) as double, 0.5) as int;
        neighbours[i] = neighbours[i] + pow(2, 28 - dist);
      }
    }
  }

  // Gather score and indexes together to sort them
  val dataList = StringList.empty();
  for i, count in neighbours {
    if (count < 0) continue;
    dataList.add(
        sortableInt(count) ~ ' '
        ~ sortableInt(1073741823 - chunks[i*2])~ ':' ~ sortableInt(1073741823 - chunks[i*2+1]) ~ ' '
        ~ i);
  }
  val sortedData = dataList.toArray();
  ArrayUtil.sort(sortedData);
  ArrayUtil.reverse(sortedData);
  utils.log('🌍 Chunk sorted data "number_of_neughbours distance_value index": \n' ~ StaticString.join(sortedData, '\n'));
  val sortedIndexes = intArrayOf(sortedData.length, -1);
  for i, line in sortedData { sortedIndexes[i] = line.split(' ')[2] as int; }

  // Group indexes
  var groups = [] as int[][];
  val alreadyAdded = boolArrayOf(sortedIndexes.length, false);
  for i, indexI in sortedIndexes {
    if (alreadyAdded[i]) continue;
    val x1 = chunks[indexI*2];
    val z1 = chunks[indexI*2+1];
    var newGroup = [indexI] as int[];
    if (i + 1 < sortedIndexes.length) {
      for j in (i + 1) .. sortedIndexes.length {
        val indexJ = sortedIndexes[j];
        if (alreadyAdded[j]) continue;
        val x2 = chunks[indexJ*2];
        val z2 = chunks[indexJ*2+1];
        if (isClose(x1, z1, x2, z2, 28 / 2)) {
          newGroup += indexJ;
          alreadyAdded[j] = true;
        }
      }
    }
    groups += newGroup;
  }

  return groups;
}

function getGroupSize(
  startIndex as int,
  firstChunkIndex as int,
  sortedChunks as string[],
  chunkArr as int[]
) as int {
  val x1 = chunkArr[firstChunkIndex*2];
  val z1 = chunkArr[firstChunkIndex*2+1];
  val minMax = [x1, z1, x1, z1] as int[];

  var j = startIndex;
  while (true) {
    if (j + 1 >= sortedChunks.length) return j;

    val nextIndex = sortedChunks[j + 1].split(' ')[2] as int;
    val x = chunkArr[nextIndex*2];
    val z = chunkArr[nextIndex*2+1];
    if (
      !isClose(minMax[0], minMax[1], x, z, 28 / 2)
      || !isClose(minMax[2], minMax[3], x, z, 28 / 2)
    )
      return j;

    minMaxing(minMax, x, z);
    j += 1;
  }
  return j; // never
}

function minMaxing(minMax as int[], x as int, z as int) as void {
  if (x < minMax[0]) minMax[0] = x;
  if (z < minMax[1]) minMax[1] = z;
  if (x > minMax[2]) minMax[2] = x;
  if (z > minMax[3]) minMax[3] = z;
}

function isClose(x1 as int, z1 as int, x2 as int, z2 as int, dist as int) as bool {
  return abs(x2 - x1) <= dist
    && abs(z2 - z1) <= dist;
}

function sortableInt(n as int) as string {
  return StaticString.repeat(0, 10 - (n~'').length) ~ n;
}


zenClass Messenger {
  val maxWidth as int = 34;
  var grid as IData[][] = [];

  var dim as int = 0;
  var anchors as int[] = null;
  var claims as int[] = null;
  var titles as [IData] = null;

  val dimColors as string[int] = {
    0: '§f',
    -1: '§c',
    1: '§e',
    7: '§a',
    144: '§3',
    3: '§b',
    14676: '§d',
  } as string[int];

  zenConstructor() {}

  function setWorldData(dim as int, anchors as int[], claims as int[], titles as [IData]) as void {
    this.dim = dim;
    this.anchors = anchors;
    this.claims = claims;
    this.titles = titles;
  }

  function chunkSymbol(index as int, x as int, z as int) as IData {
    val claimedIndex = claims[index];

    val dimColor = dimColors[dim];

    return tpMessage(
      dim, 8.5 + x * 16, 200, 8.5 + z * 16, (isNull(dimColor) ? dimColors[0] : dimColor) ~ (isInclude(anchors, x, z) ? '▓' : '█'),
      null, claimedIndex < 0 ? null as IData : ['§b' ~ titles[claimedIndex]]
    );
  }

  function isInclude(chunkPosArr as int[], x as int, z as int) as bool {
    if (chunkPosArr.length > 0) {
      for i in 0 .. chunkPosArr.length / 2 {
        if (chunkPosArr[i*2] != x || chunkPosArr[i*2+1] != z) continue;
        return true;
      }
    }
    return false;
  }

  function pushGroup(group as int[], width as int, chunkArr as int[]) as void {
    val height = group.length / width;

    var y1 = fit(width, height);
    if (y1 < 0) {
      flush();
      y1 = 0;
    }
    val x1 = line(y1).length;

    for y in 0 .. height {
      val v = y + y1;

      val prefix =
        height==1 ? '▐' :
        y==0 ? '╔' :
        (y==height - 1) ? '╚' :
        '╟';
      push('' ~ prefix, x1, v);
      for x in 0 .. width {
        val u = x + x1;
        val i = group[y * width + x];
        if (i < 0) {
          push('▒', u, v);
          continue;
        }

        val symbol = chunkSymbol(i, chunkArr[i*2], chunkArr[i*2+1]);
        push(symbol, u, v);
      }
    }
  }

  function line(y as int) as IData[] {
    while (grid.length <= y) grid += [] as IData[];
    return grid[y];
  }

  function push(char as IData, u as int, v as int) as void {
    line(v);
    while (grid[v].length <= u - 1) grid[v] = grid[v] + '▔';
    grid[v] = grid[v] + char;
  }

  function fit(width as int, height as int) as int {
    for y, line in grid {
      if (line.length + width > maxWidth) continue;
      if (grid.length != 0 && y + height > grid.length) return -1;

      var found = true;
      for v in y .. grid.length {
        if (grid[v].length > line.length) {
          found = false;
          break;
        }
      }
      if (found) return y;
    }
    return -1;
  }

  function flush() as void {
    var merged = [] as IData;
    for i, line in grid {
      var plainString = '';
      if (i != 0) merged += ['\n'] as IData;
      for char in line {
        if (isNull(char.asList())) {
          plainString += char.asString();
        } else {
          if (plainString != '') {
            merged += [plainString];
            plainString = '';
          }
          merged += [char] as IData;
        }
      }
      if (plainString != '') merged += [plainString];
    }
    if (merged.asList().length > 0) message(client.player, [{
      text: '',
      color: 'dark_gray',
      extra: merged,
    }]);
    grid = [];
  }

}

function abs(n as int) as int {return n < 0 ? -n : n;} #>
