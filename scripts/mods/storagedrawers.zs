#modloaded storagedrawers

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.ITooltipFunction;

// *======= Recipes =======*

// Drawer Controller
recipes.remove(<storagedrawers:controller>);
recipes.addShaped('Drawer Controller',
  <storagedrawers:controller>,
  [[<ic2:resource:11>, <ic2:resource:11>, <ic2:resource:11>],
    [<immersiveengineering:metal_decoration0:3>, <ore:drawerBasic>, <immersiveengineering:metal_decoration0:3>],
    [<appliedenergistics2:smooth_sky_stone_block>, <ore:gemDiamondRat>, <appliedenergistics2:smooth_sky_stone_block>]]);

// Drawer 1x1
recipes.addShapedMirrored('Drawer 1x1',
  <storagedrawers:basicdrawers>,
  [[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [null, <ore:chest>, null],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);

// Drawer 1x2
recipes.addShapedMirrored('Drawer 1x2',
  <storagedrawers:basicdrawers:1> * 2,
  [[<ore:plankWood>, <ore:chest>, <ore:plankWood>],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [<ore:plankWood>, <ore:chest>, <ore:plankWood>]]);

// Drawer 2x2
recipes.addShapedMirrored('Drawer 2x2',
  <storagedrawers:basicdrawers:2> * 4,
  [[<ore:chest>, <ore:plankWood>, <ore:chest>],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [<ore:chest>, <ore:plankWood>, <ore:chest>]]);

// Half Drawer 1x2
recipes.addShapedMirrored('Half Drawer 1x2',
  <storagedrawers:basicdrawers:3> * 2,
  [[<ore:slabWood>, <ore:chest>, <ore:slabWood>],
    [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>],
    [<ore:slabWood>, <ore:chest>, <ore:slabWood>]]);

// Half Drawer 2x2
recipes.addShapedMirrored('Half Drawer 2x2',
  <storagedrawers:basicdrawers:4> * 4,
  [[<ore:chest>, <ore:slabWood>, <ore:chest>],
    [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>],
    [<ore:chest>, <ore:slabWood>, <ore:chest>]]);

// Trim
recipes.addShapedMirrored('Trim',
  <storagedrawers:trim> * 4,
  [[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [<ore:stickWood>, <ore:plankWood>, <ore:stickWood>]]);

// [Creative Storage Upgrade] from [Storage Upgrade (V)][+7]
craft.remake(<storagedrawers:upgrade_creative>, ['pretty',
  'M # D # M',
  '# S T S #',
  '⌃ t o t ⌃',
  '# S T S #',
  'M # D # M'], {
  'M': <tconstruct:materials:19>,            // Mending Moss
  '#': <randomthings:spectreplank>,          // Spectre Planks
  'D': <draconicevolution:infused_obsidian>, // Draconium Infused Obsidian
  'S': <storagedrawers:upgrade_storage:2>,   // Storage Upgrade (III)
  'T': <draconicevolution:chaos_shard:3>,    // Tiny Chaos Fragment
  '⌃': <extrautils2:decorativesolid:6>,      // Blue Quartz
  't': <storagedrawers:upgrade_storage:3>,   // Storage Upgrade (IV)
  'o': <storagedrawers:upgrade_storage:4>,   // Storage Upgrade (V)
});

// Upgrades
function remakeDrawerUpgrade(item as IItemStack, primary as IIngredient) {
  remakeEx(item, [
    [primary, <ore:stickWood>, primary],
    [<ore:stickWood>, <storagedrawers:upgrade_template>, <ore:stickWood>],
    [primary, <ore:stickWood>, primary]]);
}

remakeDrawerUpgrade(<storagedrawers:upgrade_storage:0>, <ore:nuggetLead>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:1>, <ore:nuggetEndSteel>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:2>, <ore:nuggetMirion>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:3>, <ore:nuggetVividAlloy>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:4>, <ore:nuggetUltimate>);

// [Upgrade Template]*2 from [Basic Drawer][+2]
craft.remake(<storagedrawers:upgrade_template> * 2, ['pretty',
  '# D #',
  '# # #',
  '# B #'], {
  'B': <ore:drawerBasic>,    // Basic Drawer
  '#': <ore:stickWood>,      // Stick
  'D': <minecraft:deadbush>, // Dead Bush
});

// Drawers clearing
function clearDrawer(inputs as IItemStack[]) as void  {
  for it in inputs {
    recipes.addShapeless('Clearing ' ~ getItemName(it), it, [it]);
  }
}
// clearDrawer(<ore:drawerBasic>.items); # Somehow it still give oredict
clearDrawer([<storagedrawers:compdrawers>]);

// [Basic Tank] from [Block of Black Quartz][+2]
craft.remake(<fluiddrawers:tank>, ['pretty',
  'Q ⌃ Q',
  'F   F',
  'Q ⌃ Q'], {
  'Q': <immersiveengineering:stone_decoration:9>, // Quickdry Concrete
  '⌃': <ore:blockQuartzBlack>,                    // Block of Black Quartz
  'F': <flopper:flopper>,                         // Flopper
});
craft.make(<fluiddrawers:tank>, ['pretty',
  'Q ⌃ Q',
  'F   F',
  'Q ⌃ Q'], {
  'Q': <forestry:propolis:*>,
  '⌃': <ore:blockQuartzBlack>,                    // Block of Black Quartz
  'F': <flopper:flopper>,                         // Flopper
});

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// Drawer sealed content
function sealed(name as string, amount as int = 0) as string {
  if (isNull(name)) return null;
  return amount > 0
    ? '§2Sealed: §a' ~ name ~ ' §2(§ax' ~ amount ~ '§2)'
    : '§2Sealed: §a' ~ name;
}
function sealedItem(item as IItemStack) as string {
  if (isNull(item)) return null;
  return sealed(item.displayName, item.amount);
}

function firstItemInList(data as IData, amount as int = 0) as IItemStack {
  if (isNull(data) || isNull(data.asList())) return null;

  for itemStorage in data.asList() {
    val itemData = itemStorage.Item;
    if (isNull(itemData)) continue;
    val item = IItemStack.fromData(itemData);
    if (isNull(item) || item.isEmpty) continue;
    return item * max(1,
      amount != 0
        ? amount / D(itemStorage).getInt('Conv', 1)
        : D(itemStorage).getInt('Count', 1)
    );
  }
  return null;
}

// Basic Drawers
val basicDrawerTooltip as ITooltipFunction = function (item) {
  return sealedItem(firstItemInList(D(item.tag).get('tile.Drawers')));
};
<storagedrawers:basicdrawers:*>.addAdvancedTooltip(basicDrawerTooltip);
<storagedrawers:customdrawers:*>.addAdvancedTooltip(basicDrawerTooltip);

// Compact Drawers
val compactDrawerTooltip as ITooltipFunction = function (item) {
  val d = D(item.tag);
  return sealedItem(firstItemInList(d.get('tile.Drawers.Items'), d.getInt('tile.Drawers.Count')));
};
<storagedrawers:compdrawers>.addAdvancedTooltip(compactDrawerTooltip);

// Framed Drawers
if (!isNull(loadedMods['framedcompactdrawers'])) {
  itemUtils.getItem('framedcompactdrawers:framed_compact_drawer').addAdvancedTooltip(compactDrawerTooltip);
}

// Fluid Drawers
if (!isNull(loadedMods['fluiddrawers'])) {
  val fluidDrawerTooltip as ITooltipFunction = function (item) {
    val dTag = D(item.tag);
    val fluidName = dTag.getString('Tile.Drawer.Fluid.FluidName');
    if (isNull(fluidName)) return null;
    val fluid = game.getLiquid(fluidName);
    if (isNull(fluid)) return null;
    val fluidAmount = dTag.getInt('Tile.Drawer.Fluid.Amount');
    return sealed(fluid.displayName, fluidAmount);
  };
  <fluiddrawers:tank_custom>.addAdvancedTooltip(fluidDrawerTooltip);
  <fluiddrawers:tank>.addAdvancedTooltip(fluidDrawerTooltip);
}
// ---------------------------------------------------------------------------
