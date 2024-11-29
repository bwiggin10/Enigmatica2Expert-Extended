#modloaded zenutils ctintegration
#priority 1500
#reloadable

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import native.net.minecraft.tileentity.TileEntity;
import native.net.minecraft.util.math.BlockPos;

import scripts.do.hand_over_your_items.tellrawItemObj;

zenClass Op {
  zenConstructor() {}
  var reportPlayer as IPlayer = null;
}
static op as Op = Op();

events.register(function (e as crafttweaker.event.WorldTickEvent) {
  if (e.world.remote || e.phase != 'END') return;
  if (isNull(op.reportPlayer)) return;

  var total = 0;
  var loaders = 0;
  for te in e.world.native.loadedTileEntityList {
    if (te.isInvalid()) continue;
    if (isChunkLoader(te)) {
      report(op.reportPlayer, e.world, te.getPos());
      loaders += 1;
    }
    total += 1;
  }

  op.reportPlayer.sendRichTextMessage(crafttweaker.text.ITextComponent.fromData([
    `§7(Click on coordinates to teleport)`,
    `\n§8Total ticked TileEntities: §7${total}`,
  ]));

  op.reportPlayer = null;
});

function isChunkLoader(te as TileEntity) as bool {
  return te instanceof native.ic2.core.block.machine.tileentity.TileEntityChunkloader
    || te instanceof native.com.rwtema.extrautils2.tile.TileChunkLoader
    || te instanceof native.lumien.randomthings.tileentity.TileEntityEnderAnchor
    || (
      te instanceof native.mekanism.common.tile.TileEntityQuantumEntangloporter
      && (te as native.mekanism.common.tile.TileEntityQuantumEntangloporter)
        .upgradeComponent.getUpgrades(native.mekanism.common.Upgrade.ANCHOR) > 0)
        || (
          te instanceof native.hellfirepvp.astralsorcery.common.tile.TileRitualLink
          && !isNull((te as native.hellfirepvp.astralsorcery.common.tile.TileRitualLink)
            .getLinkedTo()))
            || (
              te instanceof native.sonar.fluxnetworks.common.tileentity.TileFluxCore
              && (te as native.sonar.fluxnetworks.common.tileentity.TileFluxCore).isForcedLoading());
}

function show(player as IPlayer) as IData {
  if (player.world.remote) return null;
  op.reportPlayer = player;
  return ['§8Looking for chunk loading TEs...'];
}

function report(player as IPlayer, world as IWorld, pos as BlockPos) as void {
  val item = scripts.do.portal_spread.utils.blockPosToItem(world, pos);
  val targetText = `§8Dim §7${world.dimension} §8[§4${pos.x} §3${pos.y} §2${pos.z}§8]`;
  player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromData([{
    text      : targetText,
    hoverEvent: {
      action: 'show_text',
      value : `TP to ${targetText}`,
    },
    clickEvent: {
      action: 'run_command',
      value : `/tpx ${player.name} ${pos.x} ${pos.y} ${pos.z} ${world.dimension}`,
    },
    extra: [
      tellrawItemObj(item),
    ],
  }]));
}
