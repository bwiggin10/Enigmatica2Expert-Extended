#modloaded zenutils ctintegration
#priority 1500
#reloadable

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import native.net.minecraft.world.chunk.Chunk;
import native.net.minecraft.world.gen.ChunkProviderServer;

function show(player as IPlayer) as IData {
  if (player.world.remote) return null;

  val worldNative = player.world.native;

  val chunkProvider = worldNative.getChunkProvider() as ChunkProviderServer;
  val loadedChunks as [Chunk] = chunkProvider.getLoadedChunks();
  var totalChunksLoaded = 0;
  for chunk in loadedChunks {
    totalChunksLoaded += 1;
  }

  return [`§8Total chunks loaded: §7${totalChunksLoaded}`];
}
