#modloaded gendustry

import crafttweaker.item.IItemStack;

// Add ability hide all other gene tempelates except empty one
// mods.jei.JEI.addItemNBTSubtype(<gendustry:gene_template>);

// *======= Recipes =======*

// Genetics Processor
recipes.remove(<gendustry:genetics_processor>);
recipes.addShapedMirrored('Genetics Processor',
  <gendustry:genetics_processor> * 2,
  [[<appliedenergistics2:material:17>, <appliedenergistics2:material:11>, <appliedenergistics2:material:17>],
    [<ore:circuitAdvanced>, <ore:nuggetEnderium>, <ore:circuitAdvanced>],
    [<appliedenergistics2:material:17>, <appliedenergistics2:material:11>, <appliedenergistics2:material:17>]]);

// Environmental Processor
recipes.remove(<gendustry:env_processor>);
recipes.addShaped('Environmental Processor',
  <gendustry:env_processor> * 2,
  [[<appliedenergistics2:material:17>, <ic2:plate:4>, <appliedenergistics2:material:17>],
    [<ore:plateLapis>, <ore:plateDenseGold>, <ore:plateLapis>],
    [<appliedenergistics2:material:17>, <ic2:plate:4>, <appliedenergistics2:material:17>]]);

// Mutagen Tank
recipes.remove(<gendustry:mutagen_tank>);
recipes.addShaped('Mutagen Tank',
  <gendustry:mutagen_tank>,
  [[<ore:plateTin>, <ore:blockGlass>, <ore:plateTin>],
    [<ore:plateTin>, <aeadditions:certustank>, <ore:plateTin>],
    [<ore:plateTin>, <ore:blockGlass>, <ore:plateTin>]]);

// Upgrade Frame
recipes.remove(<gendustry:upgrade_frame>);
recipes.addShaped('Upgrade Frame',
  <gendustry:upgrade_frame> * 2,
  [[<ore:plateDenseTin>, <ore:plateSilicon>, <ore:plateDenseTin>],
    [<ore:plateSilicon>, <industrialforegoing:range_addon:*>, <ore:plateSilicon>],
    [<ore:plateDenseTin>, <ore:plateSilicon>, <ore:plateDenseTin>]]);

// Power Module
recipes.remove(<gendustry:power_module>);
recipes.addShaped('Power Module',
  <gendustry:power_module>,
  [[<ore:gearBronze>, <ore:gemAmber>, <ore:gearBronze>],
    [<ore:gemAmber>, <mekanism:energyupgrade>, <ore:gemAmber>],
    [<ore:gearBronze>, <ore:gemAmber>, <ore:gearBronze>]]);

// Harded labware
craft.make(<gendustry:labware> * 16, ['pretty',
  'H   H',
  'H A H',
  '  B  '], {
  H: <ic2:fluid_cell>,
  A: <forestry:propolis>,
  B: <ore:dustEndstone>,
});

// Harded Pollen kit
craft.shapeless(<gendustry:pollen_kit> * 4, 'AABC', {
  A: <gendustry:labware>,
  B: <ore:dustEmerald>,
  C: <forestry:crafting_material:2>,
});

// Remove invalid honey combs from TE Centrifugal Separator. Who knows why they even exist in the first place
// This affects combs with metadata 17-25
for i in 17 .. 26 {
  val comb as IItemStack = <gendustry:honey_comb>.definition.makeStack(i) as IItemStack;
  mods.thermalexpansion.Centrifuge.removeRecipe(comb);
}
