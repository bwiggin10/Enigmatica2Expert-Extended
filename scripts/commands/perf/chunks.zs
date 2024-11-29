#modloaded zenutils ctintegration
#priority 1500
#reloadable

import crafttweaker.data.IData;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import native.net.minecraft.tileentity.TileEntity;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.world.chunk.Chunk;
import native.net.minecraft.world.gen.ChunkProviderServer;
import scripts.do.hand_over_your_items.tellrawItemObj;

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
