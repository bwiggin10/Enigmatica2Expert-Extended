#modloaded industrialforegoing teslacorelib

import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.industrialforegoing.BioReactor;
import mods.industrialforegoing.FluidDictionary;
import mods.industrialforegoing.ProteinReactor;

function fluidDict(ins as string[]) {
  for one in ins {
    for two in ins {
      if (one != two) {
        FluidDictionary.add(one, two, 1);
      }
    }
  }
}

// FluidDictionary Recipes
fluidDict(['seed.oil', 'seed_oil']);
fluidDict(['mead', 'short.mead']);
fluidDict(['sulfuric_acid', 'sulfuricacid']);
fluidDict(['for.honey', 'honey']);
fluidDict(['ic2milk', 'milk']);
fluidDict(['if.protein', 'protein']);
fluidDict(['ic2creosote', 'creosote']);
fluidDict(['liquiddeuterium', 'deuterium']);
fluidDict(['distwater', 'ic2distilled_water']);
fluidDict(['tritium','liquidtritium']);
fluidDict(['liquidfusionfuel','deuterium-tritium_mixture']);

// Protein Reactor, additional entires
for item in <ore:listAllmeatraw>.items {
  ProteinReactor.add(item);
}

// BioReactor, additional entries
val otherCrops = [
  <harvestcraft:almonditem>,
  <harvestcraft:amaranthitem>,
  <harvestcraft:barleyitem>,
  <harvestcraft:breadfruititem>,
  <harvestcraft:cashewitem>,
  <harvestcraft:chestnutitem>,
  <harvestcraft:flaxitem>,
  <harvestcraft:garlicitem>,
  <harvestcraft:gingeritem>,
  <harvestcraft:juteitem>,
  <harvestcraft:kaleitem>,
  <harvestcraft:kenafitem>,
  <harvestcraft:milletitem>,
  <harvestcraft:mustardseedsitem>,
  <harvestcraft:oatsitem>,
  <harvestcraft:peanutitem>,
  <harvestcraft:pecanitem>,
  <harvestcraft:pistachioitem>,
  <harvestcraft:quinoaitem>,
  <harvestcraft:sisalitem>,
  <harvestcraft:spiceleafitem>,
  <harvestcraft:walnutitem>,
  <rustic:chili_pepper>,
] as IItemStack[];

for crop in otherCrops {
  BioReactor.add(crop);
}

for seed in <ore:listAllseed>.items {
  BioReactor.add(seed);
}

for veggie in <ore:listAllveggie>.items {
  BioReactor.add(veggie);
}

for fruit in <ore:listAllfruit>.items {
  BioReactor.add(fruit);
}

// Diamond Gear
mods.immersiveengineering.MetalPress.addRecipe(<thermalfoundation:material:26>, <minecraft:diamond>, <immersiveengineering:mold:1>, 10000, 4);

// Black Hole Tank
recipes.removeByRecipeName('industrialforegoing:black_hole_tank');
recipes.addShapedMirrored('Black Hole Tank', <industrialforegoing:black_hole_tank>,
  [[<ore:sheetSteel>, <mekanism:plasticblock:8>, <ore:sheetSteel>],
    [<extrautils2:drum:3>, <botania:manaresource:5>, <extrautils2:drum:3>],
    [<ore:sheetSteel>, <mekanism:plasticblock:8>, <ore:sheetSteel>]]);

// [Black Hole Unit] from [Machine Case][+4]
recipes.removeShaped(<industrialforegoing:black_hole_unit>);
craft.make(<industrialforegoing:black_hole_unit>, ['pretty',
  'R * R',
  'R M R',
  '■ U ■'], {
  '■': <mekanism:plasticblock:*>,   // Grey Plastic Block
  'R': <ore:itemRubber>,            // Plastic
  'U': <mekanism:basicblock:6>.withTag({ tier: 3 }), // Ultimate Bin
  '*': <actuallyadditions:item_crystal_empowered:3>, // Empowered Void Crystal
  'M': <teslacorelib:machine_case>, // Machine Case
});

// Black Hole Controller
recipes.remove(<industrialforegoing:black_hole_controller_reworked>);
recipes.addShapedMirrored('Black Hole Controller', <industrialforegoing:black_hole_controller_reworked>,
  [[<ore:itemRubber>, <actuallyadditions:block_crystal_empowered:3>, <ore:itemRubber>],
    [<advancedrocketry:ic:3>, <storagedrawers:controller>, <advancedrocketry:ic:3>],
    [<mekanism:plasticblock:8>, <mekanism:plasticblock:8>, <mekanism:plasticblock:8>]]);

// Machine Case
recipes.remove(<teslacorelib:machine_case>);
recipes.addShaped('Tesla Core Lib Machine Case',
  <teslacorelib:machine_case>,
  [[<ic2:resource:11>, <ore:itemRubber>, <ic2:resource:11>],
    [<ore:itemRubber>, <ic2:resource:13>, <ore:itemRubber>],
    [<ic2:resource:11>, <ore:itemRubber>, <ic2:resource:11>]]);

// Mob Duplicator
recipes.remove(<industrialforegoing:mob_duplicator>);
recipes.addShapedMirrored('Mob Duplicator',
  <industrialforegoing:mob_duplicator>,
  [[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>],
    [<exnihilocreatio:item_doll>, <teslacorelib:machine_case>, <exnihilocreatio:item_doll:1>],
    [<ore:blockEmerald>, <thermalexpansion:frame:147>, <ore:blockEmerald>]]);

// [Laser Drill] from [Machine Frame][+4]
craft.remake(<industrialforegoing:laser_drill>, ['pretty',
  '¤ R R',
  '■ ◙ L',
  '¤ R R'], {
  '■': <ore:blockRefinedGlowstone>, // Refined Glowstone
  'R': <ore:itemRubber>,            // Plastic
  '¤': <ore:gearDiamond>,           // Diamond Gear
  '◙': <thermalexpansion:frame>,    // Machine Frame
  'L': <mekanism:machineblock2:13>, // Laser
});

// Laser Base
recipes.remove(<industrialforegoing:laser_base>);
recipes.addShaped('Laser Base',
  <industrialforegoing:laser_base>,
  [[<ore:itemRubber>, <ore:blockRefinedGlowstone>, <ore:itemRubber>],
    [<ore:plateDenseGold>, <thermalexpansion:frame>, <ore:plateDenseGold>],
    [<ore:gearDiamond>, <ore:blockOsmiridium>, <ore:gearDiamond>]]);

// Simplify Converter Recipes
recipes.remove(<industrialforegoing:oredictionary_converter>);
recipes.addShaped('Industrialforegoing Oredictionary Converter',
  <industrialforegoing:oredictionary_converter>,
  [[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>],
    [<ore:itemRubber>, <ore:oreIron>, <ore:itemRubber>],
    [<ore:nuggetFakeIron>, <ore:ingotFakeIron>, <ore:blockFakeIron>]]);

recipes.remove(<industrialforegoing:fluiddictionary_converter>);
recipes.addShaped('Industrialforegoing Fluiddictionary Converter',
  <industrialforegoing:fluiddictionary_converter>,
  [[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>],
    [<ore:blockGlass>, <ore:oreIron>, <ore:blockGlass>],
    [<flopper:flopper>, <ore:gearIron>, <flopper:flopper>]]);

// Oredict Belts Recipes
// [White Conveyor Belt*32] from [Redstone][+2]
craft.remake(<industrialforegoing:conveyor> * 32, ['pretty',
  'R R R',
  '▬ ♥ ▬',
  'R R R'], {
  'R': <ore:itemRubber>, // Plastic
  '♥': <ore:dustRedstone>, // Redstone
  '▬': <ore:ingotFakeIron>, // Iron Alloy Ingot
});

recipes.remove(<industrialforegoing:conveyor_upgrade>);
recipes.addShaped(<industrialforegoing:conveyor_upgrade>, [
  [<ore:ingotFakeIron>, <ore:itemRubber>, <ore:ingotFakeIron>],
  [<ore:ingotFakeIron>, <minecraft:dispenser>, <ore:ingotFakeIron>],
  [<ore:ingotFakeIron>, <industrialforegoing:conveyor:*>, <ore:ingotFakeIron>]]);
recipes.remove(<industrialforegoing:conveyor_upgrade:1>);

recipes.addShaped(<industrialforegoing:conveyor_upgrade:1>, [
  [<ore:ingotFakeIron>, <ore:itemRubber>, <ore:ingotFakeIron>],
  [<ore:ingotFakeIron>, <minecraft:hopper>, <ore:ingotFakeIron>],
  [<ore:ingotFakeIron>, <industrialforegoing:conveyor:*>, <ore:ingotFakeIron>]]);

// mob_imprisonment_tool
recipes.remove(<industrialforegoing:mob_imprisonment_tool>);
recipes.addShaped(<industrialforegoing:mob_imprisonment_tool>, [
  [<ic2:sheet:1>, <ic2:sheet:1>, <ic2:sheet:1>],
  [<mekanism:plasticblock:*>, <quark:soul_powder>, <mekanism:plasticblock:*>],
  [<ic2:sheet:1>, <ic2:sheet:1>, <ic2:sheet:1>],
]);

// [Mob Slaughter Factory] from [Machine Case][+4]
craft.remake(<industrialforegoing:mob_slaughter_factory>, ['pretty',
  'R T R',
  'F M F',
  'R □ R'], {
  '□': <ore:plateSilver>,
  'R': <industrialforegoing:plastic>,          // Plastic
  'T': <immersiveengineering:metal_device1:8>, // Tesla Coil
  'F': <redstonearsenal:material:224>,         // Fluxed Armor Plating
  'M': <teslacorelib:machine_case>,            // Machine Case
});

remake('Mob Crusher',   <industrialforegoing:mob_relocator>, [
  [<ore:itemRubber>, <redstonearsenal:tool.sword_flux>.anyDamage(), <ore:itemRubber>],
  [<randomthings:imbue:2>, <teslacorelib:machine_case>, <randomthings:imbue:2>],
  [<ore:gearGold>, <extrautils2:user>, <ore:gearGold>]]);

remake('Mob Crusher 2',   <industrialforegoing:mob_relocator>, [
  [<ore:itemRubber>, <redstonearsenal:tool.sword_flux>.anyDamage(), <ore:itemRubber>],
  [<randomthings:imbue:2>, <teslacorelib:machine_case>, <randomthings:imbue:2>],
  [<ore:gearGold>, <opencomputers:robot>, <ore:gearGold>]]);

// More sludge outputs
mods.industrialforegoing.SludgeRefiner.add(<rustic:fertile_soil>, 10);
mods.industrialforegoing.SludgeRefiner.add(<thermalfoundation:material:816>, 10);
mods.industrialforegoing.SludgeRefiner.add(<forestry:fertilizer_bio>, 10);
mods.industrialforegoing.SludgeRefiner.add(<forestry:mulch>, 10);
mods.industrialforegoing.SludgeRefiner.add(<thaumcraft:nugget:10>, 10);

// Fluid Extractor
mods.industrialforegoing.Extractor.add(<integrateddynamics:menril_log>, <fluid:menrilresin> * 5);
mods.industrialforegoing.Extractor.remove(<thaumcraft:log_silverwood>);
mods.industrialforegoing.Extractor.add(<thaumcraft:log_silverwood>, <fluid:fluid_quicksilver> * 5);

// Stackable black hole tanks
<industrialforegoing:black_hole_unit>.maxStackSize = 64;
<industrialforegoing:black_hole_tank>.maxStackSize = 64;

// Harder as being best tree chopping magic box
// [Plant Gatherer] from [Machine Case][+4]
craft.remake(<industrialforegoing:crop_recolector>, ['pretty',
  'R ~ R',
  '□ M □',
  'R E R'], {
  '□': <ic2:block_cutting_blade:2>, // Block Cutting Blade (Diamond)
  'R': <ore:itemRubber>,            // Plastic
  'E': <ore:gearElectrumFlux>,      // Fluxed Electrum Gear
  'M': <teslacorelib:machine_case>, // Machine Case
  '~': LiquidIngr('if.protein'), // Protein Bucket
});

// Remake IF addons to being much harder at huge (+12) ranges
for i, oreName in [
  'FakeIron',
  'Lead',
  'Osmium',
  'Invar',
  'Ardite',
  'RefinedGlowstone',
  'ElectricalSteel',
  'ElectrumFlux',
  'EssenceMetal',
  'Enderium',
  'Osmiridium',
  'Mirion',
] as string[] {
  val currentAddon = <industrialforegoing:range_addon>.definition.makeStack(i);

  // Main crafting method
  craft.remake(currentAddon, ['pretty',
    '▬ R ▬',
    '▬ □ ▬',
    '▬ R ▬'], {
    '□': <integratedterminals:menril_glass>,
    'R': <ore:itemRubber>,     // Plastic
    '▬': oreDict.get('ingot' ~ oreName),
  });

  if (i == 0) continue;
  // Upgrade is 9x times cheaper
  craft.make(currentAddon, ['pretty',
    '▬ R ▬',
    '▬ □ ▬',
    '▬ R ▬'], {
    '□': <industrialforegoing:range_addon>.definition.makeStack(i - 1),
    'R': <ore:itemRubber>,     // Plastic
    '▬': oreDict.get('nugget' ~ oreName),
  });
}

// [Infinity Drill] from [Laser Drill][+4]
recipes.removeByRecipeName('industrialforegoing:infinity_drill_0');
craft.make(<industrialforegoing:infinity_drill>, ['pretty',
  '  S D',
  '▬ L S',
  '▬ B  '], {
  'B': <industrialforegoing:black_hole_unit>, // Black Hole Unit
  'S': <immersiveengineering:drillhead:*>,    // Steel Drill Head
  'D': <actuallyadditions:item_drill:*>,      // Drill
  '▬': <ore:ingotPinkMetal>,                  // Pink Slime Ingot
  'L': <industrialforegoing:laser_drill>,     // Laser Drill
});

// [Enchantment Factory] from [Machine Case][+5]
craft.remake(<industrialforegoing:enchantment_invoker>, ['pretty',
  'R u R',
  '¤ M ¤',
  'E B E'], {
  'R': <industrialforegoing:plastic>, // Plastic
  'B': <teslacorelib:base_addon>,   // Base Addon
  '¤': <ore:gearMithril>,           // Mana Infused Gear
  'E': <darkutils:monolith>,
  'u': scripts.mods.bibliocraft_books.bookWrittenBy_ingr['Cow'],
  'M': <teslacorelib:machine_case>, // Machine Case
});

// [Enchantment Extractor] from [Machine Case][+5]
craft.remake(<industrialforegoing:enchantment_extractor>, ['pretty',
  'R B R',
  '¤ M ¤',
  'E n E'], {
  'R': <industrialforegoing:plastic>, // Plastic
  'B': scripts.mods.bibliocraft_books.bookWrittenBy_ingr['Cow'],
  '¤': <ore:gearPlatinum>,          // Platinum Gear
  'E': <darkutils:monolith>,
  'M': <teslacorelib:machine_case>, // Machine Case
  'n': <thaumcraft:fabric:*>,       // Enchanted Fabric
});

// [Energy Field Addon] from [Range Addon][+2]
craft.remake(<industrialforegoing:energy_field_addon>, ['pretty',
  'F ▬ F',
  '▬ R ▬',
  'F ▬ F'], {
  'R': <industrialforegoing:range_addon:*>, // Range Addon
  'F': <fluxnetworks:flux>,                 // Flux
  '▬': <ore:ingotPinkMetal>,                // Pink Slime Ingot
});

// [Pitiful Fuel Generator] from [Rubber][+4]
craft.remake(<industrialforegoing:pitiful_fuel_generator>, ['pretty',
  '░ □ ░',
  '¤ R ¤',
  '░ F ░'], {
  '░': <ore:cobblestone>,   // Cobblestone
  '□': <ore:plateGold>,     // Gold Plate
  '¤': <ore:gearIron>,      // Iron Gear
  'R': <ore:itemRubber>,    // Rubber
  'F': <minecraft:furnace>, // Furnace
});

// [Block Placer] from [Aluminum Plate][+2]
craft.remake(<industrialforegoing:block_placer>, ['pretty',
  'R ░ R',
  '░ □ ░',
  'R ░ R'], {
  'R': <ore:itemRubber>, // Rubber
  '░': <ore:cobblestone>, // Cobblestone
  '□': <ore:plateAluminium>, // Aluminum Plate
});

// Remove barely all Ore benification to leave only meat washing
function cleanupBenification(item as IItemStack, ingot as IItemStack, dust as IItemStack, fluid as ILiquidStack) as void {
  recipes.removeShapeless(<*>, [item, <immersiveengineering:tool>]);
  // furnace.remove(ingot, item.anyDamage());
  mods.actuallyadditions.Crusher.removeRecipe(dust);
  mods.appliedenergistics2.Grinder.removeRecipe(item);
  mods.astralsorcery.Grindstone.removeRecipe(dust);
  mods.enderio.SagMill.removeRecipe(item);
  mods.extrautils2.Crusher.remove(item);
  mods.immersiveengineering.ArcFurnace.removeRecipe(ingot);
  mods.immersiveengineering.Crusher.removeRecipesForInput(item);
  mods.mekanism.chemical.injection.removeRecipe(<*>, item);
  mods.mekanism.enrichment.removeRecipe(item);
  mods.mekanism.purification.removeRecipe(<*>, item);
  mods.nuclearcraft.Melter.removeRecipeWithInput(item);
  mods.tconstruct.Melting.removeRecipe(fluid, item);
  mods.thermalexpansion.Crucible.removeRecipe(item);
  mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, item);
  mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:865>, item);
  mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:866>, item);
  mods.thermalexpansion.Pulverizer.removeRecipe(item);
}

mods.thaumcraft.Crucible.removeRecipe(<jaopca:item_clustertitanium>);
cleanupBenification(<libvulpes:ore0:8>, <libvulpes:productingot:7>, <libvulpes:productdust:7>, <fluid:titanium>);

// Peaceful alt
mods.rustic.EvaporatingBasin.addRecipe(<industrialforegoing:pink_slime>, <liquid:if.pink_slime> * 1000, 30 * 20);
mods.advancedrocketry.RecipeTweaker.forMachine('Crystallizer').builder()
  .outputs(<industrialforegoing:pink_slime> * 16)
  .input(<fluid:if.pink_slime> * 16000)
  .power(30000).timeRequired(10).build();

// [White Laser Lens] from [Purple Dye][+3]
for i, dye in scripts.vars.oreDye {
  recipes.removeByRecipeName('industrialforegoing:laser_lens_' ~ i);
  craft.make(<industrialforegoing:laser_lens>.definition.makeStack(i), ['pretty',
    'I ▬ I',
    '- d -',
    'I ▬ I'], {
    'I': <immersiveengineering:stone_decoration:8>, // Insulating Glass
    '▬': <ore:ingotPinkMetal>,                      // Pink Slime Ingot
    '-': <ore:ingotEssenceMetal>,                   // Essence-Infused Ingot
    'd': dye,
  });
}

// Fast plastic alt
scripts.process.alloy([<industrialforegoing:dryrubber>], <industrialforegoing:plastic> * 9, 'only: AdvRockArc');
