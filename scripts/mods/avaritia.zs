#reloadable
#modloaded avaritia

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

val anyAvaritiaMatterTools = <avaritia:infinity_hoe> |
  <avaritia:infinity_axe> |
  <avaritia:infinity_pickaxe>.withTag({hammer: 1 as byte}) |
  <avaritia:infinity_shovel>.withTag({destroyer: 1 as byte});
scripts.jei.crafting_hints.addInsOutCatl([], <avaritia:matter_cluster>, anyAvaritiaMatterTools);
scripts.jei.crafting_hints.addInsOutCatl([], <avaritia:matter_cluster>.withTag({clusteritems: {total: 4096}}), anyAvaritiaMatterTools);

// *======= Recipes =======*

mods.avaritia.ExtremeCrafting.remove(<avaritia:ultimate_stew>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:cosmic_meatballs>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_helmet>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_chestplate>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_pants>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_boots>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_sword>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_bow>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_pickaxe>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_shovel>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_axe>);
mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_hoe>);

// Infinity Ingot
mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:6>);
craft.make(<avaritia:resource:6>, ['pretty',
  '▬ ▬ ▬ ▬ ▬ ▬ ▬ ▬ ▬',
  '▬ * I I s I I * ▬',
  '▬ I * * I * * I ▬',
  '▬ * I I s I I * ▬',
  '▬ ▬ ▬ ▬ ▬ ▬ ▬ ▬ ▬'], {
  '▬': <ore:ingotCosmicNeutronium>,
  '*': <ore:ingotCrystalMatrix>,
  'I': <avaritia:resource:5>,
  's': <contenttweaker:ultimate_singularity>,
});

// [Neutron Collector] from [Glitch Infused Ingot][+4]
mods.avaritia.ExtremeCrafting.remove(<avaritia:neutron_collector>);
craft.make(<avaritia:neutron_collector>, ['pretty',
  '⌃ U U U ⌃',
  'U C T C U',
  'U T ▬ T U',
  'U C T C U',
  '⌃ U U U ⌃'], {
  'C': <advgenerators:controller>, // Control Circuit
  '⌃': <extrautils2:decorativesolid:6>, // Blue Quartz
  'T': <draconicevolution:chaos_shard:3>, // Tiny Chaos Fragment
  'U': <ore:circuitUltimate>, // Ultimate Control Circuit
  '▬': <ore:ingotGlitch>, // Glitch Infused Ingot
});

// Neutronium Compressor isn't used
mods.avaritia.ExtremeCrafting.remove(<avaritia:neutronium_compressor>);

// Infinity Catalyst
mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:5>);
mods.extendedcrafting.TableCrafting.addShapeless(0, <avaritia:resource:5>,
  [<avaritia:ultimate_stew>, <avaritia:endest_pearl>, <ore:gemBenitoite>,
    <ore:tokenOrIdolFlag>, <ore:gemAnglesite>, <darkutils:shulker_pearl>, <avaritia:cosmic_meatballs>,
    <quark:soul_bead>, <ore:slimecrystalPink>, <ore:plateElite>, <bloodmagic:demon_crystal>,
    <ore:dragonEgg>, <scalinghealth:heartcontainer>,
    <rustic:fluid_bottle>.withTag({ Fluid: { FluidName: 'wine', Amount: 1000, Tag: { Quality: 1 as float } } }),
    <ore:blockWither>, <ore:crystalAethium>, <ore:blockCosmicNeutronium>, <extendedcrafting:storage:7>,
    <ore:blockEvilMetal>, <ore:blockCoalCoke>, <ore:compressed3xDustBedrock>, <tconstruct:firewood:1>,
    <ore:blockVividAlloy>, <ore:blockAmethyst>, <randomthings:spectreilluminator>,
    <twilightforest:block_storage:4>, <ore:blockSupremium>, <ore:blockDilithium>,
    <ore:blockCrystalMatrix>, <ore:blockEnderium>, <deepmoblearning:infused_ingot_block>,
    <contenttweaker:terrestrial_artifact_block>, <extrautils2:decorativesolid:6>, <appliedenergistics2:fluix_block>,
    <draconicevolution:draconium_block:1>, <ore:blockMyrmexResin>,
    <advancedrocketry:hotturf>, <forestry:bee_combs_0>, <ore:blockBoundMetal>,
    <ore:blockAstralStarmetal>, <ore:blockOsgloglas>, <ore:blockMirion>, <ore:blockTrinitite>]);

// [Endest Pearl] from [Pristine Enderman Matter][+5]
mods.avaritia.ExtremeCrafting.remove(<avaritia:endest_pearl>);
craft.make(<avaritia:endest_pearl>, ['pretty',
  '    - D -    ',
  '  - ▬ ▬ ▬ -  ',
  '- ▬ E ⌂ E ▬ -',
  'D ▬ ⌂ P ⌂ ▬ D',
  '- ▬ E ⌂ E ▬ -',
  '  - ▬ ▬ ▬ -  ',
  '    - D -    '], {
  'P': <deepmoblearning:pristine_matter_enderman>, // Pristine Enderman Matter
  '⌂': <actuallyadditions:block_misc:8>, // Ender Casing
  'D': <minecraft:dragon_breath>, // Dragon's Breath
  'E': <darkutils:monolith>,
  '▬': <ore:ingotEndorium>, // Endorium Ingot
  '-': <ore:ingotEndSteel>, // End Steel Ingot
});

// [Skullfire Sword] from [Obsidian Skull][+6]
mods.avaritia.ExtremeCrafting.remove(<avaritia:skullfire_sword>);
craft.make(<avaritia:skullfire_sword>, ['pretty',
  '        *',
  '      R  ',
  'D ■ O    ',
  '  ▄ ■    ',
  'S   D    '], {
  '*': <bloodmagic:lava_crystal>, // Lava Crystal
  'R': <rats:ratlantean_flame>, // Ratlantean Spirit Flame
  'D': <ore:boneDragon>, // Dragon Bone
  '■': <ore:blockBone>, // Bone Block
  'O': <randomthings:obsidianskull>, // Obsidian Skull
  '▄': <iceandfire:dragon_bone_block>, // Block of Dragon Bones
  'S': <cyclicmagic:soulstone>, // Soulstone
});

// [Ultimate Stew]*9 from [Cosmic Meatballs][+6]
craft.make(<avaritia:ultimate_stew> * 9, ['pretty',
  '  F       F  ',
  '■ F B C B F ■',
  '■ G G G G G ■',
  '■ G G G G G ■',
  '■ ( ( ( ( ( ■',
  '  ■ ■ ■ ■ ■  ',
  '  ▲ ▲ ▲ ▲ ▲  '], {
  '■': <ore:blockDilithium>, // Block of Dilithium
  '▲': <ore:dustMana>, // Mana Dust
  'B': <rustic:fluid_bottle>.withTag({ Fluid: { FluidName: 'wine', Amount: 1000, Tag: { Quality: 1.0 as float } } }), // Bottle of Wine
  'C': <avaritia:cosmic_meatballs>, // Cosmic Meatballs
  'F': <nuclearcraft:foursmore>, // FourS'more QuadS'mingot
  'G': <ore:foodNutrients5>, // Golden Apple
  '(': <ic2:filled_tin_can>, // (Filled) Tin Can
});

// [Cosmic Meatballs]
mods.extendedcrafting.TableCrafting.addShapeless(
  <avaritia:cosmic_meatballs> * 9, [
    /* Inject_js(
  getCSV('config/tellme/items-csv.csv')
  .filter(o=>o['Ore Dict keys'].split(',').includes('listAllmeatraw'))
  .map(o=>itemize(o['Registry name'], o['Meta/dmg']))
	.sort(naturalSort)
  .map(o=>[`   ${isJEIBlacklisted(o)?'#':' '}<${o}> ?? <minecraft:beef>,`])
) */
    <betteranimalsplus:eel_meat_raw> ?? <minecraft:beef>,
    <betteranimalsplus:pheasantraw> ?? <minecraft:beef>,
    <betteranimalsplus:turkey_leg_raw> ?? <minecraft:beef>,
    <betteranimalsplus:turkey_raw> ?? <minecraft:beef>,
    <betteranimalsplus:venisonraw> ?? <minecraft:beef>,
    <harvestcraft:duckrawitem> ?? <minecraft:beef>,
    <harvestcraft:groundbeefitem> ?? <minecraft:beef>,
    <harvestcraft:groundchickenitem> ?? <minecraft:beef>,
    <harvestcraft:groundduckitem> ?? <minecraft:beef>,
    <harvestcraft:groundfishitem> ?? <minecraft:beef>,
    <harvestcraft:groundmuttonitem> ?? <minecraft:beef>,
    <harvestcraft:groundporkitem> ?? <minecraft:beef>,
    <harvestcraft:groundrabbititem> ?? <minecraft:beef>,
    <harvestcraft:groundturkeyitem> ?? <minecraft:beef>,
    <harvestcraft:groundvenisonitem> ?? <minecraft:beef>,
    <harvestcraft:grubitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofabbititem> ?? <minecraft:beef>,
    <harvestcraft:rawtofaconitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofeakitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofenisonitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofickenitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofuduckitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofurkeyitem> ?? <minecraft:beef>,
    <harvestcraft:rawtofuttonitem> ?? <minecraft:beef>,
    <harvestcraft:turkeyrawitem> ?? <minecraft:beef>,
    <harvestcraft:venisonrawitem> ?? <minecraft:beef>,
    <minecraft:beef> ?? <minecraft:beef>,
    <minecraft:chicken> ?? <minecraft:beef>,
    <minecraft:mutton> ?? <minecraft:beef>,
    <minecraft:porkchop> ?? <minecraft:beef>,
    <minecraft:rabbit> ?? <minecraft:beef>,
    <rats:raw_rat> ?? <minecraft:beef>,
    <tconevo:edible> ?? <minecraft:beef>,
    <twilightforest:raw_meef> ?? <minecraft:beef>,
/**/
  ]);

val armorIngrs = {
  '▬': <ore:ingotCosmicNeutronium>,
  '-': <ore:ingotInfinity>,
  'I': <avaritia:resource:5>,
  'M': <avaritia:matter_cluster:*>,
  'r': <draconicevolution:draconic_helm:*>,
  'c': <draconicevolution:draconic_chest:*>,
  'D': <draconicevolution:draconic_legs:*>,
  'a': <draconicevolution:draconic_boots:*>,
} as IIngredient[string];

craft.remake(<avaritia:infinity_helmet>, ['pretty',
  '    ▬ ▬ ▬ ▬ ▬  ',
  '  ▬ - - - - - ▬',
  '  ▬   I M I   ▬',
  '  ▬ - - r - - ▬',
  '  ▬ - - - - - ▬',
  '  ▬ -   -   - ▬'], armorIngrs
);
craft.remake(<avaritia:infinity_chestplate>, ['pretty',
  '  ▬ ▬       ▬ ▬  ',
  '▬ ▬ ▬       ▬ ▬ ▬',
  '▬ ▬ ▬       ▬ ▬ ▬',
  '  ▬ - - M - - ▬  ',
  '  ▬ - - - - - ▬  ',
  '  ▬ - - c - - ▬  ',
  '  ▬ - - - - - ▬  ',
  '  ▬ - - - - - ▬  ',
  '    ▬ ▬ ▬ ▬ ▬    '], armorIngrs
);
craft.remake(<avaritia:infinity_pants>, ['pretty',
  '▬ ▬ ▬ ▬ ▬ ▬ ▬ ▬ ▬',
  '▬ - - - D - - - ▬',
  '▬ - ▬ M ▬ M ▬ - ▬',
  '▬ - ▬       ▬ - ▬',
  '▬ I ▬       ▬ I ▬',
  '▬ - ▬       ▬ - ▬',
  '▬ - ▬       ▬ - ▬',
  '▬ - ▬       ▬ - ▬',
  '▬ ▬ ▬       ▬ ▬ ▬'], armorIngrs
);
craft.remake(<avaritia:infinity_boots>, ['pretty',
  '  ▬ ▬ ▬   ▬ ▬ ▬  ',
  '  ▬ - ▬   ▬ - ▬  ',
  '  ▬ - ▬   ▬ - ▬  ',
  '▬ ▬ - ▬   ▬ - ▬ ▬',
  '▬ - - ▬ M ▬ - - ▬',
  '▬ ▬ ▬ ▬ a ▬ ▬ ▬ ▬'], armorIngrs
);

// Neutronium Ingot
val ni = <ore:ingotCosmicNeutronium>;
// Infinity Catalyst
val ic = <avaritia:resource:5>;
// Infinity Ingot
val ii = <ore:ingotInfinity>;
// Crystal Matrix
val cm = <ore:blockCrystalMatrix>;

// Infinity Sword
mods.extendedcrafting.TableCrafting.addShaped(0,
  <avaritia:infinity_sword>,
  [
    [null, null, null, null, null, null, null, ii, ii],
    [null, null, null, null, null, null, ii, ii, ii],
    [null, null, null, null, null, ii, ii, ii, null],
    [null, null, null, null, ii, ii, ii, null, null],
    [null, cm, null, ii, ii, ii, null, null, null],
    [null, null, cm, <draconicevolution:draconic_staff_of_power>.anyDamage(), ii, null, null, null, null],
    [null, null, ni, cm, null, null, null, null, null],
    [null, ni, null, null, cm, null, null, null, null],
    [ic, null, null, null, null, null, null, null, null],
  ]);

// Infinity Bow
mods.extendedcrafting.TableCrafting.addShaped(0,
  <avaritia:infinity_bow>,
  [
    [null, null, null, ii, ii, null, null, null, null],
    [null, null, ii, null, <ore:blockRockwool>, null, null, null, null],
    [null, ii, null, null, <ore:blockRockwool>, null, null, null, null],
    [ii, null, null, null, <ore:blockRockwool>, null, null, null, null],
    [<draconicevolution:draconic_bow>.anyDamage(), null, null, null, <ore:blockRockwool>, null, null, null, null],
    [ii, null, null, null, <ore:blockRockwool>, null, null, null, null],
    [null, ii, null, null, <ore:blockRockwool>, null, null, null, null],
    [null, null, ii, null, <ore:blockRockwool>, null, null, null, null],
    [null, null, null, ii, ii, null, null, null, null],
  ]);

// Infinity Pickaxe
mods.extendedcrafting.TableCrafting.addShaped(0,
  <avaritia:infinity_pickaxe>.withTag({ ench: [{ lvl: 10 as short, id: 35 as short }] }),
  [
    [null, ii, ii, ii, ii, ii, ii, ii, null],
    [ii, ii, ii, ii, cm, ii, ii, ii, ii],
    [ii, ii, null, null, <draconicevolution:draconic_pick>.anyDamage(), null, null, ii, ii],
    [null, null, null, null, ni, null, null, null, null],
    [null, null, null, null, ni, null, null, null, null],
    [null, null, null, null, ni, null, null, null, null],
    [null, null, null, null, ni, null, null, null, null],
    [null, null, null, null, ni, null, null, null, null],
    [null, null, null, null, ni, null, null, null, null],
  ]);

// Infinity Shovel
mods.extendedcrafting.TableCrafting.addShaped(0,
  <avaritia:infinity_shovel>,
  [
    [null, null, null, null, null, null, ii, ii, ii],
    [null, null, null, null, null, ii, ii, <ore:blockInfinity>, ii],
    [null, null, null, null, null, null, <draconicevolution:draconic_shovel>.anyDamage(), ii, ii],
    [null, null, null, null, null, ni, null, ii, null],
    [null, null, null, null, ni, null, null, null, null],
    [null, null, null, ni, null, null, null, null, null],
    [null, null, ni, null, null, null, null, null, null],
    [null, ni, null, null, null, null, null, null, null],
    [ni, null, null, null, null, null, null, null, null],
  ]);

// Infinity Axe
mods.extendedcrafting.TableCrafting.addShaped(0,
  <avaritia:infinity_axe>,
  [
    [null, null, null, ii, null, null, null, null, null],
    [null, null, ii, ii, ii, ii, ii, null, null],
    [null, null, null, ii, ii, <draconicevolution:draconic_axe>.anyDamage(), ii, null, null],
    [null, null, null, null, null, ii, ni, null, null],
    [null, null, null, null, null, null, ni, null, null],
    [null, null, null, null, null, null, ni, null, null],
    [null, null, null, null, null, null, ni, null, null],
    [null, null, null, null, null, null, ni, null, null],
    [null, null, null, null, null, null, ni, null, null],
  ]);

// Infinity Hoe
mods.extendedcrafting.TableCrafting.addShaped(0,
  <avaritia:infinity_hoe>,
  [
    [null, null, null, null, null, ni, null, null, null],
    [null, ii, ii, ii, ii, ii, ii, null, null],
    [ii, ii, ii, ii, ii, <draconicevolution:draconic_hoe>.anyDamage(), ii, null, null],
    [ii, null, null, null, null, ii, ii, null, null],
    [null, null, null, null, null, ni, null, null, null],
    [null, null, null, null, null, ni, null, null, null],
    [null, null, null, null, null, ni, null, null, null],
    [null, null, null, null, null, ni, null, null, null],
    [null, null, null, null, null, ni, null, null, null],
  ]);

recipes.remove(<avaritia:extreme_crafting_table>);
mods.extendedcrafting.CombinationCrafting.addRecipe(<avaritia:extreme_crafting_table>,
  100000000, 1000000, <vaultopic:vice>,
  [<avaritia:resource:1>, <avaritia:resource:1>, <extendedcrafting:material:12>,
    <extendedcrafting:material:12>, <avaritia:resource:1>, <avaritia:resource:1>]);

// Using Dragon forge to harder recipes
function addDragonForgeRecipe(input1 as IItemStack, input2 as IItemStack, output as IItemStack) {
  mods.iceandfire.recipes.addFireDragonForgeRecipe(input1, input2, output);
  mods.iceandfire.recipes.addIceDragonForgeRecipe(input1, input2, output);
}

recipes.removeByRecipeName('avaritia:items/resource/crystal_matrix_ingot');
addDragonForgeRecipe(<extendedcrafting:material:49>, <ore:gemDilithium>.firstItem, <avaritia:resource:1>);

mods.advancedrocketry.RecipeTweaker
  .forMachine('PrecisionLaserEtcher')
  .builder()
  .input(<extendedcrafting:material:49>)
  .input(<ore:gemDilithium>)
  .outputs(<avaritia:resource:1>)
  .power(100000)
  .timeRequired(5)
  .build();

// Oredicting recipe
// [Compressed Crafting Table] from [Crafting Table]
recipes.removeByRecipeName('avaritia:blocks/crafting/compressed_crafting_table');
craft.shapeless(<avaritia:compressed_crafting_table>, 'wwwwwwwww', {
  'w': <ore:workbench>, // Crafting Table
});

// -------------------------------------------------------------------
// Burn singularity
// -------------------------------------------------------------------
static burnSingularity as IItemStack = <avaritia:singularity:12>; // Result Singularity
static fillingSingularity as IItemStack = <avaritia:singularity:9>; // Filling Singularity
static needCharge as double = pow(10.0, 9.0);
val needChargeStr = mods.zenutils.StaticString.format('%,d', needCharge as int).replaceAll(',', '§8,§6');
furnace.setFuel(burnSingularity, needCharge);

scripts.lib.tooltip.desc.jei(fillingSingularity,
  'singularity.heat', needChargeStr
);
scripts.lib.tooltip.desc.jei(burnSingularity,
  'singularity.burn', needChargeStr
);

static getCharge as function(IItemStack)double
  = function (item as IItemStack) as double { return item.burnTime as double; };

scripts.do.charge.addRecipe(
  'Burn Singularity',
  <avaritia:singularity>, // Empty Singularity
  fillingSingularity,
  burnSingularity,
  <*>.only(function (item) { return item.burnTime > 0; }),
  needCharge,
  <contenttweaker:any_burnable>, // Fake ingredient
  getCharge
);

// Examples
function addExampleRecipe(a as IItemStack[][]) as void {
  val map = {
    0: a[0][0], 1: a[0][1], 2: a[0][2],
    3: a[1][0], 4: a[1][1], 5: a[1][2],
    6: a[2][0], 7: a[2][1], 8: a[2][2],
  } as IItemStack[string];
  val output = scripts.do.charge.chargeRecipeFunction(map, fillingSingularity, burnSingularity, needCharge, getCharge);
  if (isNull(output)) return;
  recipes.addShaped(craft.uniqueRecipeName(output), output, a);
}

addExampleRecipe([
  [<avaritia:singularity>, <minecraft:cactus>, <minecraft:carpet>],
  [<ic2:sapling>         , <minecraft:stick> , <minecraft:wooden_slab>],
  [<minecraft:planks>    , <minecraft:torch> , <thaumcraft:log_greatwood>],
]);

addExampleRecipe([
  [<avaritia:singularity>          , <harvestcraft:pressedwax> , <thaumcraft:alumentum>],
  [<thermalfoundation:material:892>, <mysticalagriculture:coal>, <forestry:peat>],
  [<minecraft:coal:1>              , <forestry:wood_pile>      , <mechanics:fuel_dust>],
]);

addExampleRecipe([
  [<avaritia:singularity>            , <mysticalagradditions:storage:2>  , <mysticalagriculture:coal_block:4>],
  [<mysticalagriculture:coal_block:3>, <mysticalagriculture:coal_block:2>, <mysticalagradditions:insanium:5>],
  [<mysticalagriculture:coal_block:1>, <mysticalagriculture:coal:4>      , <chisel:block_coal_coke>],
]);
