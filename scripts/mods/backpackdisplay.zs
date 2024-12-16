#modloaded backpackdisplay
#sideonly client

import mods.backpackdisplay.BackpackDisplay.addBackDisplay;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IWorld;
import native.net.minecraft.util.math.BlockPos;
import crafttweaker.data.IData;

function addSingularity(item as IItemStack) as void {
  if (isNull(item)) return;
  addBackDisplay(item, function(item) {
    if (isNull(item.tag) || isNull(item.tag.singularity)) return null;
    val length = scripts.do.diverse.getMapLength(item.tag.singularity);
    val result = arrayOf(length, null as IItemStack);
    var i = 0;
    for itemStr, value in item.tag.singularity.asMap() {
      val item = scripts.do.diverse.getItemFromString(itemStr);
      if (!isNull(item) && value > 0)
        result[i] = item * value;
      i += 1;
    }
    return result;
  });
}

// See in `scripts/mods/avaritia.zs`
addSingularity(<avaritia:singularity:4>);

// -----------------------------------------------------------------------------------

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

addBackDisplay(<industrialforegoing:mob_imprisonment_tool>, function(item) {
  if (isNull(item.tag) || isNull(item.tag.entity)) return null;
  return [<entity:${item.tag.entity}>.asSoul()] as IItemStack[];
});

addBackDisplay(<enderio:item_soul_vial>, function(item) {
  if (isNull(item.tag) || isNull(item.tag.entityId)) return null;
  return [<entity:${item.tag.entityId}>.asSoul()] as IItemStack[];
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

  val result = scripts.do.portal_spread.utils.blockPosToItem(world, pos);
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

/*
Scannable
*/
static blockHolderTag as function(IData)IItemStack
= function(itemTag as IData) as IItemStack {
  if (
    isNull(itemTag)
    || isNull(itemTag.block)
    || isNull(itemTag.meta)
  ) return null;
  return <item:${itemTag.block}:${itemTag.meta}>;
};

addBackDisplay(<scannable:module_block>, function(item) {
  val result = blockHolderTag(item.tag);
  if (isNull(result)) return null;
  return [result] as IItemStack[];
});

addBackDisplay(<scannable:scanner>, function(item) {
  if (
    isNull(item.tag)
    || isNull(item.tag.items)
    || isNull(item.tag.items.Items)
  ) return null;

  // Count items
  var length = 0;
  for i, it in item.tag.items.Items.asList() {
    length += 1;
    if (!isNull(blockHolderTag(it.tag))) length += 1;
  }

  if (length < 1) return null;

  // Build result
  var k = 0;
  val result = arrayOf(length, null as IItemStack) as IItemStack[];
  for it in item.tag.items.Items.asList() {
    result[k] = IItemStack.fromData(it);
    k += 1;
    val additional = blockHolderTag(it.tag);
    if (!isNull(additional)) {
      result[k] = additional;
      k += 1;
    }
  }

  return result;
});
