#modloaded backpackdisplay
#sideonly client

import mods.backpackdisplay.BackpackDisplay.addBackDisplay;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IContainerFunction;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IWorld;
import native.net.minecraft.util.math.BlockPos;

function itemFromBlockNumId(numericalID as int, meta as int) as IItemStack {
  val state = IBlockDefinition
    .getFromNumericalId(numericalID);
    // .getStateFromMeta(meta);
  // return state.block.getItem(null, null, state);
  return <item:${state.id}:${meta}>;
}

/*
Show contained block and entity of mob spawner inside
*/
addBackDisplay(<mekanism:cardboardbox>, function(item) {
  val tag = item.tag;
  if (
    isNull(tag.mekData)
    || isNull(tag.mekData.blockData)
    || isNull(tag.mekData.blockData.id)
    || isNull(tag.mekData.blockData.meta)
  ) return null;

  val block = itemFromBlockNumId(tag.mekData.blockData.id, tag.mekData.blockData.meta);
  if (isNull(block)) return null;

  var mob = null as IItemStack;

  if (!(
    isNull(tag.mekData.blockData.tileTag)
    || isNull(tag.mekData.blockData.tileTag.id)
    || tag.mekData.blockData.tileTag.id != 'minecraft:mob_spawner'
    || isNull(tag.mekData.blockData.tileTag.SpawnData)
    || isNull(tag.mekData.blockData.tileTag.SpawnData.id)
  )) {
    mob = <entity:${tag.mekData.blockData.tileTag.SpawnData.id}>.asSoul();
  }

  return isNull(mob) ? [block] as IItemStack[] : [block, mob] as IItemStack[];
});

/*
Show contained entity as soul
*/
addBackDisplay(<thermalexpansion:morb>, function(item) {
  if (isNull(item.tag) || isNull(item.tag.id)) return null;
  return [<entity:${item.tag.id}>.asSoul()] as IItemStack[];
});

/*
Point to a block
*/
addBackDisplay(<pointer:pointer>, function(item) {
  if (
    isNull(item.tag)
    || isNull(item.tag.Pointer)
    || isNull(item.tag.Pointer.Dimension)
    || isNull(item.tag.Pointer.Position)
  ) return null;

  val world = IWorld.getFromID(item.tag.Pointer.Dimension);
  if (isNull(world)) return null;

  val pos = BlockPos.fromLong(item.tag.Pointer.Position);
  if (isNull(pos)) return null;
  if (!world.isBlockLoaded(pos)) return null;

  val result = scripts.do.portal_spread.utils.stateToItem(world.getBlockState(pos));
  if (isNull(result)) return null;
  return [result] as IItemStack[];
});

/*
Obsorbed items
*/
addBackDisplay(<rftoolsdim:material_absorber>, function(item) {
  if (
    isNull(item.tag)
    || isNull(item.tag.block)
    || isNull(item.tag.meta)
    || isNull(item.tag.absorbing)
  ) return null;
  return [<item:${item.tag.block}:${item.tag.meta}> * (1028 - item.tag.absorbing.asInt())] as IItemStack[];
});
