#modloaded zenutils !toolprogression
#reloadable

import scripts.do.omnipotence.op.op;

events.register(function (e as native.net.minecraftforge.event.entity.player.PlayerEvent.HarvestCheck) {
  val player = e.entityPlayer.wrapper;
  if (isNull(player) || isNull(player.world)) return;
  if (!isNull(player.currentItem) || !op.isPlayerOmnipotent(player)) return;
  e.setCanHarvest(true);
});
