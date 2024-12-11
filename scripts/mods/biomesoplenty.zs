#modloaded biomesoplenty tconstruct

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;

// Amber Conversion
recipes.addShapeless('BoP Amber', <biomesoplenty:gem:7> * 2, [<thaumcraft:amber>, <thaumcraft:amber>]);
recipes.addShapeless('Thaumcraft Amber', <thaumcraft:amber> * 2, [<biomesoplenty:gem:7>, <biomesoplenty:gem:7>]);

// Remove oredict from amber ore to prevent it generated from Botania Flower
<ore:oreAmber>.remove(<biomesoplenty:gem_ore:7>);

// Make Quicksand
scripts.process.solution([<ore:soulSand>], [<liquid:blueslime> * 1000], [<liquid:sand> * 1000], null, 'except: highoven');

// Hardened Ice Unification
craft.make(<biomesoplenty:hard_ice> * 8, ['AAA', 'A A', 'AAA'], { A: <mysticalagriculture:ice_essence> });
scripts.process.compress(<minecraft:packed_ice> * 2, <biomesoplenty:hard_ice>);

// Poison bucket recipe fix (bucket could be duped)
recipes.remove(Bucket('poison'));
recipes.addShapeless('biomesoplenty_forge_bucketfilled_poison_dupefix', Bucket('poison'),
  [<minecraft:water_bucket>.noReturn(), <minecraft:spider_eye:*>, <minecraft:poisonous_potato:*>, <minecraft:sugar:*>]);

// Honey
recipes.addShapeless(<biomesoplenty:honey_block> * 3, [<biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>]);
recipes.addShapeless(<biomesoplenty:hive:3>, [<biomesoplenty:hive:1>, <biomesoplenty:filled_honeycomb>]);
recipes.addShapeless(<biomesoplenty:hive:1>, [<biomesoplenty:hive:2>, <biomesoplenty:filled_honeycomb>]);

// "Meat"
val rawMeat = [
  (<harvestcraft:turkeyrawitem>) % 5,
  (<minecraft:mutton> % 10),
  (<minecraft:rabbit> % 5),
  (<minecraft:chicken> % 10),
  (<minecraft:porkchop> % 10),
  (<minecraft:beef> % 10),
  <harvestcraft:venisonrawitem> % 5,
  <harvestcraft:duckrawitem> % 5,
  <rats:raw_rat> % 5,
] as WeightedItemStack[];
mods.forestry.Centrifuge.addRecipe(rawMeat, <biomesoplenty:flesh>, 100);
mods.thermalexpansion.Centrifuge.addRecipe([rawMeat[0], rawMeat[1], rawMeat[2], rawMeat[3],
] as WeightedItemStack[], <biomesoplenty:flesh>, null, 2000);

// Blood from flesh
scripts.process.melt(<biomesoplenty:fleshchunk>, <liquid:blood> * 20);

// Honey Block -> Honey Drop
mods.forestry.Centrifuge.addRecipe([(<forestry:honey_drop> * 5) % 80, (<thermalfoundation:material:99> % 25), (<thermalfoundation:material:100> % 25)], <biomesoplenty:honey_block>, 100);
mods.thermalexpansion.Centrifuge.addRecipe([(<forestry:honey_drop>) * 5 % 80, <thermalfoundation:material:99> % 25, <thermalfoundation:material:100> % 25], <biomesoplenty:honey_block>, null, 2000);

// Ender Amethyst
recipes.addShaped('Ender Amethyst',
  <biomesoplenty:gem>,
  [[<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>],
    [<ore:ingotElvenElementium>, <biomesoplenty:terrestrial_artifact>, <ore:ingotElvenElementium>],
    [<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>]]);

val terrIngrs = {
  'S': <ore:itemXP>, // Solidified Experience
  '0': <actuallyadditions:item_crystal_empowered>, // Empowered Restonia Crystal
  '1': <actuallyadditions:item_crystal_empowered:1>, // Empowered Palis Crystal
  '2': <actuallyadditions:item_crystal_empowered:2>, // Empowered Diamatine Crystal
  '3': <actuallyadditions:item_crystal_empowered:3>, // Empowered Void Crystal
  '4': <actuallyadditions:item_crystal_empowered:4>, // Empowered Emeradic Crystal
  '5': <actuallyadditions:item_crystal_empowered:5>, // Empowered Enori Crystal
} as IIngredient[string];

// [Terrestrial Artifact] from [Empowered Palis Crystal][+6]
craft.reshapeless(<biomesoplenty:terrestrial_artifact> * 3, 'SSS012345', terrIngrs);

// [Terrestrial Artifact Block] from [Empowered Palis Crystal Block][+6]
craft.reshapeless(<contenttweaker:terrestrial_artifact_block> * 3, 'SSS012345', {
  'S': <ore:itemXP>, // Solidified Experience
  '0': <actuallyadditions:block_crystal_empowered>, // Restonia
  '1': <actuallyadditions:block_crystal_empowered:1>, // Palis
  '2': <actuallyadditions:block_crystal_empowered:2>, // Diamatine
  '3': <actuallyadditions:block_crystal_empowered:3>, // Void
  '4': <actuallyadditions:block_crystal_empowered:4>, // Emeradic
  '5': <actuallyadditions:block_crystal_empowered:5>, // Enori
});

// BoP Grass, Dirt, and Netherrack.
recipes.addShaped('BoP Mycelial Netherrack', <biomesoplenty:grass:8> * 8, [[<ore:netherrack>, <ore:netherrack>, <ore:netherrack>], [<ore:netherrack>, <minecraft:mycelium>, <ore:netherrack>], [<ore:netherrack>, <ore:netherrack>, <ore:netherrack>]]);
recipes.addShaped('BoP Flowering Grass', <biomesoplenty:grass:7> * 8, [[<minecraft:double_plant:*>, <ore:grass>, <minecraft:double_plant:*>], [<ore:grass>, <minecraft:red_flower:8>, <ore:grass>], [<minecraft:double_plant:*>, <ore:grass>, <minecraft:double_plant:*>]]);
recipes.addShaped('BoP Overgrown Netherrack', <biomesoplenty:grass:6> * 8, [[<ore:netherrack>, <ore:netherrack>, <ore:netherrack>], [<ore:netherrack>, <ore:vine>, <ore:netherrack>], [<ore:netherrack>, <ore:netherrack>, <ore:netherrack>]]);
recipes.addShaped('BoP Origin Grass', <biomesoplenty:grass:5> * 16, [[<ore:sand>, <ore:grass>, <ore:sand>], [<biomesoplenty:sapling_1>, <biomesoplenty:sapling_1>, <biomesoplenty:sapling_1>], [<ore:sand>, <ore:grass>, <ore:sand>]]);
recipes.addShaped('BoP Silty Grass', <biomesoplenty:grass:4> * 8, [[<ore:sand>, <ore:grass>, <ore:sand>], [<ore:gravel>, <ore:dirt>, <ore:gravel>], [<ore:sand>, <ore:grass>, <ore:sand>]]);
recipes.addShaped('BoP Sandy Grass', <biomesoplenty:grass:3> * 8, [[<ore:sand>, <ore:grass>, <ore:sand>], [<ore:grass>, <ore:dirt>, <ore:grass>], [<ore:sand>, <ore:grass>, <ore:sand>]]);
recipes.addShaped('BoP Loamy Grass', <biomesoplenty:grass:2> * 8, [[<ore:grass>, <ore:grass>, <ore:grass>], [<ore:grass>, <ore:listAllwater>, <ore:grass>], [<ore:grass>, <ore:grass>, <ore:grass>]]);
recipes.addShaped('BoP Silty Dirt', <biomesoplenty:dirt:2> * 8, [[<ore:sand>, <ore:dirt>, <ore:sand>], [<ore:gravel>, <ore:dirt>, <ore:gravel>], [<ore:sand>, <ore:dirt>, <ore:sand>]]);
recipes.addShaped('BoP Sandy Dirt', <biomesoplenty:dirt:1> * 8, [[<ore:sand>, <ore:dirt>, <ore:sand>], [<ore:dirt>, <ore:dirt>, <ore:dirt>], [<ore:sand>, <ore:dirt>, <ore:sand>]]);
recipes.addShaped('BoP Loamy Dirt', <biomesoplenty:dirt> * 8, [[<ore:dirt>, <ore:dirt>, <ore:dirt>], [<ore:dirt>, <ore:listAllwater>, <ore:dirt>], [<ore:dirt>, <ore:dirt>, <ore:dirt>]]);

// BoP Overgrown stone
recipes.addShapeless('Overgrown Stone1', <biomesoplenty:grass:1>, [<minecraft:stone:*>, <minecraft:tallgrass:1>]);
recipes.addShapeless('Overgrown Stone2', <biomesoplenty:grass:1>, [<minecraft:stone:*>, <ore:grass>]);
recipes.addShapeless('Overgrown Stone3', <biomesoplenty:grass:1>, [<minecraft:stone:*>, <ore:vine>]);

// Amber Block
Purge(<biomesoplenty:gem_block:7>).ores([<ore:blockAmber>]);

// Terrestrial Artifact
<biomesoplenty:terrestrial_artifact>.maxStackSize = 64;

// Terrestrial Artifact block
craft.shapeless(<contenttweaker:terrestrial_artifact_block>, 'AAAAAAAAA', { A: <biomesoplenty:terrestrial_artifact> });
craft.shapeless(<biomesoplenty:terrestrial_artifact> * 9, 'A', { A: <contenttweaker:terrestrial_artifact_block> });

// Melt/cast
scripts.process.melt(<biomesoplenty:terrestrial_artifact>, <liquid:terrestrial> * 144);
scripts.process.melt(<contenttweaker:terrestrial_artifact_block>, <liquid:terrestrial> * 1296);
mods.tconstruct.Casting.addBasinRecipe(<contenttweaker:terrestrial_artifact_block>, null, <liquid:terrestrial>, 1296);
mods.tconstruct.Casting.addTableRecipe(<biomesoplenty:terrestrial_artifact>, <tconstruct:cast_custom:2>, <liquid:terrestrial>, 144, false);
mods.nuclearcraft.IngotFormer.addRecipe(<liquid:terrestrial> * 144, <biomesoplenty:terrestrial_artifact>, 1.0, 1.0);
mods.forestry.Centrifuge.addRecipe([
  terrIngrs['0'].items[0] % 33,
  terrIngrs['1'].items[0] % 33,
  terrIngrs['2'].items[0] % 33,
  terrIngrs['3'].items[0] % 33,
  terrIngrs['4'].items[0] % 33,
  terrIngrs['5'].items[0] % 33,
], <biomesoplenty:terrestrial_artifact>, 10);

// To easy manage in inventory
<biomesoplenty:jar_filled:1>.maxStackSize = 64;

// Squeeze harming potion from Bramble
scripts.process.squeeze(
  [<biomesoplenty:bramble_plant>],
  <fluid:potion>.withTag({ Potion: 'minecraft:harming' }) * 150,
  'except: CrushingTub Squeezer MechanicalSqueezer TECentrifuge',
  null
);

// Make Crystal block harder to match its mining level
<biomesoplenty:crystal>.hardness = 50;

// Skyblock alts Hellbark Sapling and lava squeezing
mods.inworldcrafting.FireCrafting.addRecipe(<biomesoplenty:leaves_3:8> * 2, <ic2:crafting:20>, 30);
scripts.process.squeeze([<biomesoplenty:log_2:7>], <liquid:lava> * 1500, 'only: Squeezer MechanicalSqueezer', null);
scripts.process.squeeze([<biomesoplenty:planks_0:11>], <liquid:lava> * 750, 'only: Squeezer MechanicalSqueezer', null);
scripts.process.squeeze([<biomesoplenty:leaves_3:8>], <liquid:lava> * 240, 'only: Squeezer MechanicalSqueezer', null);

// [Celestial Crystal Shard] from [Obsidian Shard][+1]
scripts.process.alloy([<ore:crystalPureFluix>, <tconstruct:shard>.withTag({ Material: 'obsidian' })], <biomesoplenty:crystal_shard>, 'only: Kiln AlloySmelter');

// [Biome Finder] from [Cobweb][+2]
craft.remake(<biomesoplenty:biome_finder>, ['pretty',
  'd G d',
  'G C G',
  'd G d'], {
  'd': <ore:dyePurple>, // Purple Dye
  'G': <randomthings:ingredient:5>,
  'C': <minecraft:web>, // Cobweb
});

// [Nature's Compass] from [Biome Finder][+2]
craft.remake(<naturescompass:naturescompass>, ['pretty',
  'M a M',
  'a B a',
  'M a M'], {
  'M': <tconstruct:materials:19>, // Mending Moss
  'a': <extrautils2:decorativesolidwood>, // Magical Planks
  'B': <biomesoplenty:biome_finder>, // Biome Finder
});

// [Mud] from [Dirt][+1]
recipes.removeByRecipeName('biomesoplenty:mud_from_dirt');
craft.shapeless(<biomesoplenty:mud>, 'Ad', {
  'A': <ore:listAllwater>, // Fresh Water
  'd': <ore:dirt>, // Dirt
});

recipes.addShapeless('Biome Essence clear tag', <biomesoplenty:biome_essence>, [<biomesoplenty:biome_essence>]);

<entity:biomesoplenty:wasp>.addPlayerOnlyDrop(<extrautils2:spike_gold> % 50, 1, 1);

// Higher efficient stick conversion
// [Framed Trim] from [Bamboo]
craft.shapeless(<storagedrawers:customtrim>, '#########', {
  '#': <biomesoplenty:bamboo>, // Bamboo
});

// [Framed Trim] from [River Cane]
craft.shapeless(<storagedrawers:customtrim>, '#########', {
  '#': <biomesoplenty:plant_1:5>, // River Cane
});

///////////////////////////////////////////////////////////////
// Flooding drop rework
///////////////////////////////////////////////////////////////
// To avoid flooding inventory with tens of flower variants,
// we make them drom their dyes and other respective results

for input, output in {
  <biomesoplenty:double_plant:0>: <minecraft:dye:12>,
  <biomesoplenty:double_plant:1>: <biomesoplenty:brown_dye:0>,
  <biomesoplenty:flower_0:0>    : <minecraft:dye:7>,
  <biomesoplenty:flower_0:1>    : <minecraft:dye:6>,
  <biomesoplenty:flower_0:2>    : <biomesoplenty:black_dye:0>,
  <biomesoplenty:flower_0:3>    : <minecraft:dye:6>,
  <biomesoplenty:flower_0:4>    : <minecraft:dye:12>,
  <biomesoplenty:flower_0:5>    : <minecraft:dye:14>,
  <biomesoplenty:flower_0:6>    : <minecraft:dye:9>,
  <biomesoplenty:flower_0:7>    : <minecraft:dye:13>,
  <biomesoplenty:flower_0:8>    : <minecraft:dye:5>,
  <biomesoplenty:flower_0:9>    : <biomesoplenty:white_dye:0>,
  <biomesoplenty:flower_0:10>   : <biomesoplenty:black_dye:0>,
  <biomesoplenty:flower_0:11>   : <minecraft:dye:1>,
  <biomesoplenty:flower_0:12>   : <minecraft:dye:8>,
  <biomesoplenty:flower_0:13>   : <minecraft:dye:9>,
  <biomesoplenty:flower_0:14>   : <biomesoplenty:white_dye:0>,
  <biomesoplenty:flower_0:15>   : <minecraft:dye:14>,
  <biomesoplenty:flower_1:0>    : <minecraft:dye:5>,
  <biomesoplenty:flower_1:1>    : <minecraft:dye:11>,
  <biomesoplenty:flower_1:2>    : <biomesoplenty:blue_dye:0>,
  <biomesoplenty:flower_1:3>    : <minecraft:dye:9>,
  <biomesoplenty:flower_1:4>    : <minecraft:dye:12>,
  <biomesoplenty:flower_1:5>    : <minecraft:dye:1>,
  <biomesoplenty:mushroom:0>    : <biomesoplenty:shroompowder:0>,
  <biomesoplenty:mushroom:2>    : <biomesoplenty:blue_dye:0>,
  <biomesoplenty:mushroom:3>    : <minecraft:dye:10>,
  <biomesoplenty:mushroom:4>    : <biomesoplenty:brown_dye:0>,
  <biomesoplenty:plant_1:3>     : <actuallyadditions:item_food:16>,
  <biomesoplenty:plant_1:4>     : <biomesoplenty:brown_dye:0>,
  <biomesoplenty:plant_1:10>    : <minecraft:dye:1>,
} as IItemStack[IItemStack]$orderly {
  scripts.lib.dropt.addDrop(input, output, 1.25, 'shears;-1;-1');
}

///////////////////////////////////////////////////////////////
