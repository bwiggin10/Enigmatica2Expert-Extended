#modloaded plustic

import crafttweaker.item.IIngredient;
import modtweaker.tconstruct.ITICMaterial;

// material: [energy, power, range]
val newStats = {
  <ticmat:copper>   : [10000000],
  <ticmat:silver>   : [700000000],
  <ticmat:blaze>    : [500000000  , 15, 50],
  <ticmat:manyullyn>: [80000000],
  <ticmat:endrod>   : [1000000000 , 9 , 90],

  <ticmat:prismarine>: [0        , 9 , 15],
  <ticmat:starmetal> : [0        , 5 , 25],
  <ticmat:psigem>    : [0        , 3 , 55],
} as int[][ITICMaterial];

for mat, arr in newStats {
  var k = 0;
  if (arr[k] != 0) mods.plustic.toolstats.energy(mat, arr[k]); k += 1;
  if (arr.length > k && arr[k] != 0) mods.plustic.toolstats.laserPower(mat, arr[k]); k += 1;
  if (arr.length > k && arr[k] != 0) mods.plustic.toolstats.laserRange(mat, arr[k]); k += 1;
}

mods.tconstruct.Casting.removeTableRecipe(<plustic:battery_cell>.withTag({ Material: 'copper' }));
mods.tconstruct.Casting.removeTableRecipe(<plustic:battery_cell>.withTag({ Material: 'silver' }));
mods.tconstruct.Casting.removeTableRecipe(<plustic:battery_cell>.withTag({ Material: 'manyullyn' }));

// -------------------------------------------------------------------------------
// Laser Nerfs
// -------------------------------------------------------------------------------

val laserMediums = {
  blaze     : [<ore:rodBlaze>            , <ore:ingotMelodicAlloy>],
  prismarine: [<ore:gemPrismarine>       , <ore:ingotVoid>],
  psigem    : [<ore:gemPsi>              , <ore:ingotEnderEnhanced>],
  starmetal : [<ore:ingotAstralStarmetal>, <ore:ingotGlitch>],
  endrod    : [<minecraft:end_rod>       , <ore:ingotMithrillium>],
} as IIngredient[][string];

// [Blazerod Laser Medium] from [Chaos Shard][+3]
for mat, arr in laserMediums {
  val item = <plustic:laser_medium>.withTag({ Material: mat });
  mods.jei.JEI.addItem(item);
  craft.make(item, ['‚▬*'], {
    '‚': <pointer:pointer>,
    '▬': arr[0],
    '*': arr[1],
  });
}

// -------------------------------------------------------------------------------

// [Copper Battery Cell] from [Huge Stalk][+1]
craft.remake(<plustic:battery_cell>.withTag({ Material: 'copper' }), ['pretty',
  '  ■  ',
  '■ H ■',
  '  ■  '], {
  '■': <ore:blockCopper>,           // Block of Copper
  'H': <twilightforest:huge_stalk>, // Huge Stalk
});

// [Silver Battery Cell] from [Arcane Technology][+1]
craft.remake(<plustic:battery_cell>.withTag({ Material: 'silver' }), ['pretty',
  '  ■  ',
  '■ § ■',
  '  ■  '], {
  '■': <ore:blockSilver>,        // Block of Silver
  '§': <rats:arcane_technology>, // Arcane Technology
});

// [Blazerod Battery Cell] from [Fire Dragonsteel Ingot][+1]
craft.remake(<plustic:battery_cell>.withTag({ Material: 'blaze' }), ['pretty',
  '  ■  ',
  '■ ▬ ■',
  '  ■  '], {
  '■': <ore:blockBlaze>, // Blaze Mesh
  '▬': <ore:ingotFireDragonsteel> | <ore:dragonsteelIngot>, // Fire Dragonsteel Ingot
});

// [Manyullyn Battery Cell] from [Eldritch Stone][+1]
craft.remake(<plustic:battery_cell>.withTag({ Material: 'manyullyn' }), ['pretty',
  '  ■  ',
  '■ E ■',
  '  ■  '], {
  '■': <ore:blockManyullyn>,             // Block of Manyullyn
  'E': <thaumcraft:stone_eldritch_tile>, // Eldritch Stone
});

// [Endrod Battery Cell] from [Broken Sword Part][+1]
craft.remake(<plustic:battery_cell>.withTag({ Material: 'endrod' }), ['pretty',
  '  /  ',
  '/ B /',
  '  /  '], {
  'B': <endreborn:sword_shard>, // Broken Sword Part
  '/': <minecraft:end_rod>,     // End Rod
});

// [Osmiridium Ingot] from [Iridium Ingot][+1]
scripts.process.alloy([<ore:nuggetOsmium>, <ore:nuggetIridium>], <plustic:osmiridiumnugget> * 2, 'Only: Kiln');

<entity:plustic:blindbandit>.addDrop(<randomthings:ingredient:13>, 10, 30);
<entity:plustic:supremeleader>.addDrop(<mechanics:bursting_powder>, 10, 30);
