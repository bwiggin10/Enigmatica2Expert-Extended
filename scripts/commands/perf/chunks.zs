#modloaded zenutils ctintegration
#priority 1500
#reloadable

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import mods.zenutils.StringList;
import native.com.feed_the_beast.ftblib.lib.math.ChunkDimPos;
import native.com.feed_the_beast.ftbutilities.data.ClaimedChunks;
import native.net.minecraft.tileentity.TileEntity;
import native.net.minecraft.world.gen.ChunkProviderServer;
import native.net.minecraft.world.chunk.Chunk;
import native.net.minecraft.world.World;
import scripts.commands.perf.loaders.forEachChunkLoader;
import mods.zenutils.NetworkHandler;

// ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀
// ▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄
// ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀ ▄█▀

/*
▀▁▂▃▄▅▆▇█▉▊▋▌▍▎▏
▐░▒▓▔▕▖▗▘▙▚▛▜▝▞▟
*/

function show(player as IPlayer) as IData {
  val data = arrayOf(
    server.native.worlds.length,
    null as IData) as IData[];
  
  var totalChunksLoaded = 0;
  val titlesList = StringList.empty();

  for i, world in server.native.worlds as World[] {
    val chunks = getLoadedChunks(world);
    if (chunks.length <= 0) continue;
    totalChunksLoaded += chunks.length / 2;

    val dim = world.wrapper.dimension as int;

    // Claimed chunk teams
    val claims = intArrayOf(chunks.length / 2, -1);
    for i in 0 .. chunks.length / 2 {
      val chunkDimPos = ChunkDimPos(chunks[i*2], chunks[i*2+1], dim);
      val claimedChunk = ClaimedChunks.instance.getChunk(chunkDimPos);
      if (!isNull(claimedChunk)) {
        val title = claimedChunk.team.commandTitle.unformattedText;
        val index = titlesList.indexOf(title);
        if (index >= 0) {
          claims[i] = index;
        } else {
          claims[i] = titlesList.size;
          titlesList.add(title);
        }
      }
    }

    data[i] = {
      dim: dim,
      chunks: chunks,
      players: getWorldPlayers(world.wrapper),
      anchors: getAnchoredChunks(world.wrapper),
      claims: claims,
    } as IData;
  }

  var titles = [] as IData;
  for title in titlesList { titles += [title] as IData; }

  send(player, {
    viewDistance: server.native.playerList.viewDistance as int,
    worlds: IData.createDataList(data),
    titles: titles,
  });

  return [
    // `§7Total chunks §8[§7Loaded §8/ §7By Player §8/ §7The Rest§8]:`,
    // `\n§8[§3${totalChunksLoaded} §8/ §3${totalPlayerLoaded} §8/ §3${totalChunksLoaded - totalPlayerLoaded}§8]`,
    // `\n§7View distance: §3${server.native.playerList.viewDistance}`,
    `§7Total loaded chunks: §3${totalChunksLoaded}`,
    `\n§7View distance: §3${server.native.playerList.viewDistance}`,
  ];
}


zenClass AnchorCounter {
  zenConstructor(){}
  var anchors as int[] = [] as int[];
}
static anchorCounter as AnchorCounter = AnchorCounter();

function getAnchoredChunks(world as IWorld) as int[] {
  anchorCounter.anchors = [];
  var total = forEachChunkLoader(world, function(te as TileEntity) as void {
    val pos = te.pos;
    anchorCounter.anchors += pos.x / 16;
    anchorCounter.anchors += pos.z / 16;
  });
  return anchorCounter.anchors;
}

function getLoadedChunks(world as World) as int[] {
  val chunkProvider = world.getChunkProvider() as ChunkProviderServer;
  val loadedChunks = chunkProvider.getLoadedChunks() as [Chunk];
  var chunkCount = 0;
  for chunk in loadedChunks { chunkCount += 1; }
  val result = intArrayOf(chunkCount * 2);
  for i, chunk in loadedChunks {
    result[i*2  ] = (chunk as Chunk).x;
    result[i*2+1] = (chunk as Chunk).z;
  }
  return result;
}

function getWorldPlayers(world as IWorld) as int[] {
  // Get indexes of chunks loaded by players
  val players = intArrayOf(world.getPlayers().length * 2);
  for i, p in world.getPlayers() {
    players[i*2  ] = (p.x / 16) as int;
    players[i*2+1] = (p.z / 16) as int;
  }
  return players;
}

function send(player as IPlayer, data as IData) as void {
  utils.log('🌍 sent to client:\n'~data.asString());
  NetworkHandler.sendTo('perf_chunks',
    player, function (b) { b.writeData(data); });
}
