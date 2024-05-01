#modloaded endreborn

import crafttweaker.item.IItemStack;

// Add missed furnace recipe
furnace.addRecipe(<endreborn:item_ingot_wolframium>, <qmd:dust>, 4.0);

// Chronologist
<entity:endreborn:chronologist>.addPlayerOnlyDrop(<deepmoblearning:living_matter_extraterrestrial>, 1, 2);

// Mage-Barclay
<entity:endreborn:endlord>.addPlayerOnlyDrop(<storagedrawers:upgrade_storage:4>, 1, 2);

// Remove hammer recipes
for recipeName in [
  'unidict:dustobsidian_x3_size.3',
  'endreborn:items/item_shard_obsidian',
  'endreborn:items/prismarine_2',
  'endreborn:items/item_raw_endorium',
  'endreborn:items/purpur_block',
  'endreborn:items/dragon_scales',
  'endreborn:items/item_lormyte_crystal',
  'endreborn:items/brick',
  'endreborn:items/prismarine',
  'endreborn:items/glowstone_dust',
  'endreborn:items/quartz_block',
  'endreborn:items/netherbrick',
  'endreborn:blocks/cobblestone',
  'endreborn:items/catalyst',
] as string[] {
  recipes.removeByRecipeName(recipeName);
}

Purge(<endreborn:food_ender_flesh>);

scripts.process.fill(<ore:dustDimensional>, <liquid:crystal> * 1000, <endreborn:catalyst>);

// Add dust because materializer can work only with this one
mods.jei.JEI.addItem(<endreborn:catalyst>);

// Remake [Fluix-Plated Iron Ingot]
mods.appliedenergistics2.Inscriber.removeRecipe(<threng:material:2>);
mods.appliedenergistics2.Inscriber.addRecipe(<threng:material:2>, <endreborn:item_ingot_wolframium>, false, <threng:material:1>, <appliedenergistics2:material:45>);
mods.threng.Aggregator.removeRecipe(<threng:material>);
mods.threng.Aggregator.addRecipe(<threng:material>, <endreborn:item_ingot_wolframium>, <threng:material:1>, <appliedenergistics2:material:45>);

// Lormite rework
recipes.remove(<endreborn:block_lormyte_crystal>);
recipes.remove(<endreborn:block_decorative_lormyte>);
val LS = <endreborn:item_lormyte_crystal>;
recipes.addShapeless(LS * 9, [<endreborn:block_decorative_lormyte>]);
recipes.addShapeless(<endreborn:block_decorative_lormyte>, [LS, LS, LS, LS, LS, LS, LS, LS, LS]);
scripts.lib.dropt.addDrop(<endreborn:block_lormyte_crystal>, <endreborn:item_lormyte_crystal>);

// Fix automatic recipe
mods.actuallyadditions.Crusher.removeRecipe(<endreborn:death_essence>);

// fix wrong crusher output
mods.immersiveengineering.Crusher.removeRecipe(<qmd:dust>);
mods.immersiveengineering.Crusher.addRecipe(<qmd:dust> * 2, <ore:oreTungsten>, 2048, <nuclearcraft:dust:7>, 0.2);

// Skyblock Alternative
// [Essence Ore] from [Molten Obsidian Bucket][+1]
mods.tconstruct.Casting.addBasinRecipe(<endreborn:block_essence_ore>, <endreborn:block_decorative_lormyte>, <liquid:obsidian>, 144, true);

// Add missed ore => ingot
mods.immersiveengineering.ArcFurnace.addRecipe(<endreborn:item_ingot_wolframium> * 2, <endreborn:block_wolframium_ore>, <immersiveengineering:material:7>, 20, 2048);

// [Angel Feather] from [Blue Peacock Feather][+2]
for feather in [
  <iceandfire:amphithere_feather>,
  <iceandfire:stymphalian_bird_feather>,
  <twilightforest:raven_feather>,
] as IItemStack[] {
  craft.remake(<endreborn:item_angel_feather>, ['pretty',
    '  D  ',
    'M f M',
    '  D  '], {
    'D': <botania:manaresource:15>,
    'f': feather,
    'M': <mysticalagriculture:crafting:24>, // Mystical Feather
  });
}

// [Purpur Shards] from [End Essence]
craft.remake(<endreborn:item_end_shard>, ['pretty',
  'T   T',
  '  T  ',
  'T   T'], {
  'T': <mysticalagriculture:end_essence>, // End Essence
});

// [String of Life] from [Mystical String][+2]
craft.remake(<endreborn:item_ender_string>, ['pretty',
  '▬ K K',
  'K M K',
  'K K ▬'], {
  'K': <biomesoplenty:seaweed>, // Kelp
  '▬': <ore:ingotEndorium>, // Endorium Ingot
  'M': <mysticalagriculture:crafting:23>, // Mystical String
});

// [Ender Chest] from [Eye of Ender][+2]
craft.remake(<minecraft:ender_chest>, ['pretty',
  'o e o',
  'e E e',
  'o e o'], {
  'e': <ore:essence>, // Essence
  'E': <ore:pearlEnderEye>, // Eye of Ender
  'o': <ore:obsidian>, // Obsidian
});

// [Enchantment Table] from [Book][+3]
craft.remake(<minecraft:enchanting_table>, ['pretty',
  '  B  ',
  '◊ e ◊',
  'e o e'], {
  'B': <minecraft:book>, // Book
  'e': <ore:essence>, // Essence
  '◊': <ore:gemDiamondRat>, // Diamond
  'o': <ore:obsidian>, // Obsidian
});

// [Beacon] from [Nether Star][+3]
craft.remake(<minecraft:beacon>, ['pretty',
  '■ e ■',
  '■ S ■',
  'o o o'], {
  '■': <ore:blockGlass>, // Glass
  'S': <ore:netherStar>, // Nether Star
  'e': <ore:essence>, // Essence
  'o': <ore:obsidian>, // Obsidian
});

// [Basic Card]*2 from [Calculation Processor][+3]
craft.remake(<appliedenergistics2:material:25> * 2, ['pretty',
  '- ▬  ',
  '♥ C ▬',
  '- ▬  '], {
  'C': <appliedenergistics2:material:23>, // Calculation Processor
  '♥': <ore:dustRedstone>, // Redstone
  '▬': <ore:ingotTungsten>, // Tungsten Ingot
  '-': <ore:ingotGold>, // Gold Ingot
});

// [ME Fluid Interface] from [Annihilation Core][+3]
craft.remake(<appliedenergistics2:fluid_interface>, ['pretty',
  '▬ d ▬',
  'A   F',
  '▬ d ▬'], {
  'A': <appliedenergistics2:material:44>, // Annihilation Core
  'F': <appliedenergistics2:material:43>, // Formation Core
  'd': <ore:dyeBlue>, // Blue Pigment
  '▬': <ore:ingotTungsten>, // Tungsten Ingot
});

// [End-Mage Barclay Sword] from [String of Life][+2]
recipes.remove(<endreborn:ender_sword>);
utils.addEnchRecipe(<endreborn:ender_sword>,
  <enchantment:cyclicmagic:enchantment.beheading>, Grid(['pretty',
    '  ▬ ▬',
    '▬ S ▬',
    'B ▬  '], {
    'B': <endreborn:sword_shard>, // Broken Sword Part
    'S': <endreborn:item_ender_string>, // String of Life
    '▬': <ore:ingotEndorium>, // Endorium Ingot
  }).shaped());

// [Materializer] from [Broken Sword Part][+3]
craft.remake(<endreborn:entropy_user>, ['pretty',
  '§ ▬ §',
  '▬ B ▬',
  '§ ■ §'], {
  '■': <endreborn:block_decorative_lormyte>, // Lormyte Block
  'B': <endreborn:sword_shard>, // Broken Sword Part
  '§': <endreborn:catalyst>, // Obsidian Catalyst
  '▬': <ore:ingotEndSteel>, // End Steel Ingot
});

// [Smooth End Stone]*8 from [End Stone]
craft.remake(<endreborn:block_end_stone_smooth> * 8, ['pretty',
  'e e e',
  'e   e',
  'e e e'], {
  'e': <ore:endstone>, // End Stone
});

// [Purpur Lamp]*8 from [Magma Block][+1]
craft.remake(<endreborn:block_purpur_lamp> * 8, ['pretty',
  '■ ■ ■',
  '■ ▄ ■',
  '■ ■ ■'], {
  '■': <minecraft:purpur_block>, // Purpur Block
  '▄': <ore:blockMagma>, // Magma Block
});

// [Xorcite Cluster]*8 from [Ender Pearl][+2]
craft.reshapeless(<endreborn:dragon_essence> * 8, 'Ee11', {
  'E': <deepmoblearning:living_matter_extraterrestrial>, // Extraterrestrial Matter
  'e': <ore:enderpearl>, // Ender Pearl
  '1': <ore:compressed1xEndStone>, // Compressed End Stone
});

// [Xorcite Cluster]*8 from [Guardian Essence]*2[+1]
craft.remake(<endreborn:dragon_essence> * 8, ['pretty',
  'T i T',
  'i   i',
  'T i T'], {
  'T': <mysticalagriculture:end_essence>, // End Essence
  'i': <mysticalagriculture:guardian_essence>, // Guardian Essence
});

// [Enderemus] from [Crushed Endstone][+1]
craft.reshapeless(<endreborn:crop_ender_flower>, 'C‚', {
  'C': <exnihilocreatio:block_endstone_crushed>, // Crushed Endstone
  '‚': <ore:itemEnderFragment>,
});

// [Advanced Ender Pearl]*8 from [Dimensional Blend][+1]
craft.reshapeless(<endreborn:item_advanced_ender_pearl> * 8, 'eeee▲eeee', {
  'e': <ore:enderpearl>, // Ender Pearl
  '▲': <ore:dustDimensional>, // Dimensional Blend
});

// Purpur guards are disables, so make Purpur Shards craftable
mods.rustic.EvaporatingBasin.addRecipe(<endreborn:item_end_shard>, <liquid:liquidchorus> * 1000, 20 * 20);

// [Endorium Nugget]*6 from [Ender Lilly][+1]
scripts.do.expire_in_block.set(<extrautils2:enderlilly>, { 'cyclicmagic:fire_dark': <endreborn:item_raw_endorium> * 6 });

// [Endorium Ingot] from [Endorium Nugget]
recipes.addShapeless('Endorium Nuggets from Ingot', <endreborn:item_raw_endorium> * 9, [<endreborn:item_ingot_endorium>]);
recipes.removeByRecipeName('endreborn:items/item_ingot_endorium_2');
craft.shapeless(<endreborn:item_ingot_endorium>, '‚‚‚‚‚‚‚‚‚', {
  '‚': <endreborn:item_raw_endorium>, // Endorium Nugget
});

// ----------------------------------------------------------------------------
// Tungsten
// ----------------------------------------------------------------------------
// Fix Tungsten Nugget output from Infernal Furnace
recipes.addShapeless(<endreborn:wolframium_nugget>, [<jaopca:item_nuggettungsten>]);
craft.shapeless(<endreborn:item_ingot_wolframium>, '‚‚‚‚‚‚‚‚‚', {
  '‚': <jaopca:item_nuggettungsten>,
});

// ----------------------------------------------------------------------------
