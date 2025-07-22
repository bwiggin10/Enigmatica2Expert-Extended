#reloadable
#modloaded zenutils

import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerBreakSpeedEvent;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.PlayerCloneEvent;

val op as scripts.do.omnipotence.op.Op = scripts.do.omnipotence.op.op;

events.register(function (e as PlayerTickEvent) {
  if (e.phase != 'END') return;
  if (e.player.world.provider.worldTime % 10 != 0) return;

  val player = e.player;
  if (op.isPendingOmnipotentce(player))
    op.grant(player);
  else if (op.isPlayerOmnipotent(player))
    op.tick(player);
});

events.register(function (e as PlayerCloneEvent) {
  val player = e.player;
  if (isNull(player) || isNull(player.world) || !op.isPlayerOmnipotent(player)) return;
  op.applyAttributes(player);
});

// Mine any block
events.register(function (e as PlayerBreakSpeedEvent) {
  val player = e.player;
  if (isNull(player) || isNull(player.world) || isNull(e.block) || isNull(e.block.definition)) return;
  if (!op.isPlayerOmnipotent(player)) return;
  e.newSpeed = crafttweaker.util.Math.max(e.originalSpeed, 12.0f * e.block.definition.hardness + 1.0);
}, mods.zenutils.EventPriority.low());

// Silk touch on bare hand
events.register(function (e as BlockHarvestDropsEvent) {
  val player = e.player;
  if (
    isNull(player)
    || isNull(player.world)
    || player.world.remote
    || e.silkTouch
    || !op.isPlayerOmnipotent(player)
  ) return;

  if (isNull(player.currentItem)) {
    // Silk touch
    val silkDrop = e.block.native.getSilkTouchDrop(e.blockState);
    if (!isNull(silkDrop)) {
      e.drops = [silkDrop.wrapper];
      e.dropChance = 1;
    }
  } else {
    // TODO: Luck IV for non-empty hand
  }
});
