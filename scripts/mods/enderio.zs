#modloaded enderio

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import scripts.process.solution;

// Cheaper decorations
val casing = <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8> | <nuclearcraft:part:10>;

// This is basically quantity filter with auto input/output
// [Impulse_Hopper] from [Basic_Machine_Casing][+4]
craft.remake(<enderio:block_impulse_hopper>, ['pretty',
  '▬ ◘ ▬',
  'I □ I',
  '▬ ♥ ▬'], {
  '□': <ore:machineBlock>, // Basic Machine Casing
  '♥': <ore:blockRedstone>, // Block of Redstone
  '◘': <ore:blockHopper>, // Hopper
  'I': <ore:gearIronInfinity>, // Infinity Bimetal Gear
  '▬': <ore:ingotDarkSteel>, // Dark Steel Ingot
});

// Advanced Item Filter
recipes.remove(<enderio:item_advanced_item_filter>);
recipes.addShapedMirrored('Advanced Item Filter',
  <enderio:item_advanced_item_filter>,
  [[<ore:blockRedstone>, <ore:paper>, <ore:blockRedstone>],
    [<ore:paper>, <enderio:block_enderman_skull>, <ore:paper>],
    [<ore:blockRedstone>, <ore:paper>, <ore:blockRedstone>]]);

// [Painting Machine] from [Dyeing Machine][+5]
craft.remake(<enderio:block_painter>, ['pretty',
  'a D a',
  '¤ F ¤',
  'F ■ F'], {
  'D': <randomthings:dyeingmachine>, // Dyeing Machine
  'a': <openblocks:paintbrush>.anyDamage(), // Paint Brush
  '¤': <ore:gearIronInfinity>, // Infinity Bimetal Gear
  'F': <storagedrawers:customtrim>, // Framed Trim
  '■': <contenttweaker:silicon_block>, // Silicon Block
});

// Fused Quartz (before Alloy Smelter)
mods.nuclearcraft.AlloyFurnace.addRecipe(<minecraft:quartz> * 4, <minecraft:quartz_block>, <enderio:block_fused_quartz> * 2);

// Clear Glass (before Alloy Smelter)
recipes.addShaped('Quite Clear Glass',
  <enderio:block_fused_glass> * 8,
  [[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
    [<ore:blockGlass>, null, <ore:blockGlass>],
    [<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]]);

// [Power Buffer] from [Electrical Steel Ingot][+1]
craft.remake(<enderio:block_buffer:1>, ['pretty',
  'S ▬ S',
  '▬   ▬',
  'S ▬ S'], {
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
  '▬': <ore:ingotElectricalSteel>, // Electrical Steel Ingot
});

// Solar Panels
// Tier 2
recipes.remove(<enderio:block_solar_panel:1>);
recipes.addShapedMirrored('EnderIO Solar Panel1',
  <enderio:block_solar_panel:1>,
  [[<ore:ingotEnergeticAlloy>, <ore:ingotEnergeticAlloy>, <ore:ingotEnergeticAlloy>],
    [<enderio:block_solar_panel>, <enderio:block_solar_panel>, <enderio:block_solar_panel>],
    [<enderio:item_basic_capacitor>, <ore:fusedQuartz>, <enderio:item_basic_capacitor>]]);
// Tier 3
recipes.remove(<enderio:block_solar_panel:2>);
recipes.addShaped('EnderIO Solar Panel2',
  <enderio:block_solar_panel:2>,
  [[<ore:ingotPulsatingIron>, <ore:ingotPulsatingIron>, <ore:ingotPulsatingIron>],
    [<enderio:block_solar_panel:1>, <enderio:block_solar_panel:1>, <enderio:block_solar_panel:1>],
    [<enderio:item_basic_capacitor:1>, <ore:enlightenedFusedQuartz>, <enderio:item_basic_capacitor:1>]]);
// Tier 4
recipes.remove(<enderio:block_solar_panel:3>);
recipes.addShaped('EnderIO Solar Panel3',
  <enderio:block_solar_panel:3>,
  [[<ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>],
    [<enderio:block_solar_panel:2>, <enderio:block_solar_panel:2>, <enderio:block_solar_panel:2>],
    [<enderio:item_basic_capacitor:2>, <ore:darkFusedQuartz>, <enderio:item_basic_capacitor:2>]]);

// [Dimensional Transceiver] from [Quantum Entangloporter][+4]
craft.remake(<enderio:block_transceiver>, ['pretty',
  '■ E ■',
  'O Q O',
  '■ * ■'], {
  '■': <ore:blockElectricalSteel>, // Electrical Steel Block
  'E': <ore:skullEnderResonator>, // Ender Resonator
  'O': <enderio:item_basic_capacitor:2>, // Octadic Capacitor
  'Q': <mekanism:machineblock3>, // Quantum Entangloporter
  '*': <ore:itemEnderCrystal>, // Ender Crystal
});

// [Dimensional Transceiver] from [Quantum Entangloporter][+4]
craft.make(<enderio:block_transceiver>, ['pretty',
  '■ E ■',
  'T Q T',
  '■ * ■'], {
  '■': <ore:blockElectricalSteel>, // Electrical Steel Block
  'E': <ore:skullEnderResonator>, // Ender Resonator
  'T': <enderio:item_capacitor_totemic>.anyDamage(), // Totemic Capacitor
  'Q': <mekanism:machineblock3>, // Quantum Entangloporter
  '*': <ore:itemEnderCrystal>, // Ender Crystal
});

// Enchanter
recipes.remove(<enderio:block_enchanter>);
recipes.addShapedMirrored('EnderIO Enchanter',
  <enderio:block_enchanter>,
  [[<ore:blockMagicalWood>, <ore:blockMagicalWood>, <ore:blockMagicalWood>],
    [<rftools:infused_diamond>, <thermalexpansion:machine:13>.withTag({}), <rftools:infused_diamond>],
    [<ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>]]);

// Dialing Device
recipes.remove(<enderio:block_dialing_device>);
recipes.addShapedMirrored('EnderIO Dialing Device',
  <enderio:block_dialing_device>,
  [[null, <rftools:dialing_device>, null],
    [<ore:ingotDarkSteel>, <ore:skullEnderResonator>, <ore:ingotDarkSteel>],
    [<ore:ingotDarkSteel>, <enderio:item_basic_capacitor:2>, <ore:ingotDarkSteel>]]);

// Energized Bimetal gear
recipes.remove(<enderio:item_material:12>);
mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:12>, <enderio:item_alloy_ingot:1>, <immersiveengineering:mold:1>, 16000, 4);
mods.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:12>, <enderio:item_alloy_ingot:1> * 4, 16000);

// Vibrant Bimetal gear
recipes.remove(<enderio:item_material:13>);
mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:13>, <enderio:item_alloy_ingot:2>, <immersiveengineering:mold:1>, 16000, 4);
mods.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:13>, <enderio:item_alloy_ingot:2> * 4, 16000);

// Dark Bimetel gear
recipes.remove(<enderio:item_material:73>);
mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:73>, <enderio:item_alloy_ingot:6>, <immersiveengineering:mold:1>, 16000, 4);
mods.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:73>, <enderio:item_alloy_ingot:6> * 4, 16000);

// Machine Chassis
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_material>, <enderio:item_material:51>);
recipes.remove(<enderio:item_material:1>);
recipes.addShapedMirrored('Machine Chassis',
  <enderio:item_material:1>,
  [[<enderio:block_reinforced_obsidian>, <ore:dyeMachine>, <enderio:block_reinforced_obsidian>],
    [<ore:dyeMachine>, <enderio:item_material>, <ore:dyeMachine>],
    [<enderio:block_reinforced_obsidian>, <ore:dyeMachine>, <enderio:block_reinforced_obsidian>]]);

// [Simple Machine Chassis] from [Hardened Cell Frame][+3]
craft.remake(<enderio:item_material>, ['pretty',
  '□ ¤ □',
  'D ◘ D',
  '□ ¤ □'], {
  '□': <ore:plateTitaniumAluminide>, // Titanium Aluminide Plate
  '¤': <ore:gearIronInfinity>, // Infinity Bimetal Gear
  'D': <endreborn:block_decorative_lormyte>, // Decorative Lormyte Stone
  '◘': <thermalexpansion:frame:129>, // Hardened Cell Frame
});

// [End Steel Chassis] from [Quartzburnt][+2]
craft.remake(<enderio:item_material:66>, ['pretty',
  'E ◊ E',
  '◊ Q ◊',
  'E ◊ E'], {
  'E': <enderio:block_end_iron_bars>, // End Steel Bars
  '◊': <ore:gemXorcite>, // Xorcite Shard
  'Q': <extrautils2:decorativesolid:7>, // Quartzburnt
});

// [Basic Capacitor] from [Redstone Conductance Coil][+3]
craft.remake(<enderio:item_basic_capacitor>, ['pretty',
  '  ╱  ',
  '▲ ♥ ▲',
  '  ▬  '], {
  '╱': <ore:stickTitaniumIridium>, // Titanium Iridium Alloy Rod
  '▲': <ore:dustBedrock>, // Grains of Infinity
  '♥': <thermalfoundation:material:515>, // Redstone Conductance Coil
  '▬': <threng:material>, // Fluix Steel Ingot
});
mods.advancedrocketry.RecipeTweaker.forMachine('PrecisionAssembler').builder()
  .outputs(<enderio:item_basic_capacitor> * 64)
  .input(<ore:stickTitaniumIridium> * 32)
  .input(<ore:dustBedrock> * 32)
  .input(<thermalfoundation:material:515> * 32)
  .input(<threng:material> * 32)
  .power(320000).timeRequired(20).build();

// [Fluid Tank] from [Clear Glass][+1]
recipes.remove(<enderio:block_tank>);
mods.tconstruct.Casting.addBasinRecipe(<enderio:block_tank>, <tconstruct:clear_glass>, <liquid:construction_alloy>, 144 * 4, true);
mods.tconstruct.Casting.addBasinRecipe(<enderio:block_tank>, <tconstruct:clear_glass>, <liquid:iron>, 144 * 4, true);

// [Pressurized Fluid Tank] from [Fused Quartz][+1]
recipes.remove(<enderio:block_tank:1>);
mods.tconstruct.Casting.addBasinRecipe(<enderio:block_tank:1>, <ore:fusedQuartz>, <liquid:dark_steel>, 144 * 4, true);

// Double-Layer Capacitor
recipes.remove(<enderio:item_basic_capacitor:1>);
recipes.addShapedMirrored('Double-Layer Capacitor',
  <enderio:item_basic_capacitor:1>,
  [[null, <ore:ingotEnergeticAlloy>, null],
    [<enderio:item_basic_capacitor>, <ore:dustCoke>, <enderio:item_basic_capacitor>],
    [null, <ore:ingotEnergeticAlloy>, null]]);

// Octadic Capacitor
recipes.remove(<enderio:item_basic_capacitor:2>);
recipes.addShapedMirrored('Octadic Capacitor',
  <enderio:item_basic_capacitor:2>,
  [[<ore:ingotFerroboron>, <ore:ingotVibrantAlloy>, <ore:ingotFerroboron>],
    [<enderio:item_basic_capacitor:1>, <draconicevolution:draconium_block:1>, <enderio:item_basic_capacitor:1>],
    [<ore:ingotFerroboron>, <ore:ingotVibrantAlloy>, <ore:ingotFerroboron>]]);

// Combustion Generator
recipes.remove(<enderio:block_combustion_generator>);
recipes.addShapedMirrored('Combustion Generator',
  <enderio:block_combustion_generator>,
  [[<ore:ingotElectricalSteel>, <minecraft:furnace>, <enderio:item_alloy_ingot>],
    [<enderio:block_tank>, <ic2:resource:13>, <enderio:block_tank>],
    [<ore:gearEnergized>, <ore:craftingPiston>, <ore:gearEnergized>]]);

// Farming Station
recipes.remove(<enderio:block_farm_station>);
recipes.addShapedMirrored('Farming Station1',
  <enderio:block_farm_station>,
  [[<ore:ingotElectricalSteel>, <twilightforest:ironwood_hoe>.anyDamage(), <ore:ingotElectricalSteel>],
    [<ore:ingotElectricalSteel>, <enderio:item_material:1>, <ore:ingotElectricalSteel>],
    [<ore:gearVibrant>, <twilightforest:ironwood_axe>.anyDamage(), <ore:gearVibrant>]]);

recipes.addShapedMirrored('Farming Station2',
  <enderio:block_farm_station>,
  [[<ore:ingotElectricalSteel>, <twilightforest:steeleaf_hoe>.anyDamage(), <ore:ingotElectricalSteel>],
    [<ore:ingotElectricalSteel>, <enderio:item_material:1>, <ore:ingotElectricalSteel>],
    [<ore:gearVibrant>, <twilightforest:steeleaf_axe>.anyDamage(), <ore:gearVibrant>]]);

// The Vat
recipes.remove(<enderio:block_vat>);
recipes.addShapedMirrored('The Vat',
  <enderio:block_vat>,
  [[<ore:ingotElectricalSteel>, <minecraft:cauldron>, <ore:ingotElectricalSteel>],
    [<enderio:block_tank>, <thermalexpansion:machine:7>, <enderio:block_tank>],
   [<ore:ingotElectricalSteel>, <minecraft:cauldron>, <ore:ingotElectricalSteel>]]);

// Crafter simplify
recipes.remove(<enderio:block_simple_crafter>);
recipes.addShaped(<enderio:block_simple_crafter>, [
  [<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>],
  [<ore:ingotFakeIron>, <ic2:te:88>, <ore:ingotFakeIron>],
  [<ore:gearStone>, <ore:workbench>, <ore:gearStone>]]);

recipes.remove(<enderio:block_crafter>);
recipes.addShaped(<enderio:block_crafter>, [
  [<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>],
  [<ore:ingotFakeIron>, <ic2:te:89>, <ore:ingotFakeIron>],
  [<ore:gearIronInfinity>, <ore:workbench>, <ore:gearIronInfinity>]]);

// Power Monitor simplify
recipes.remove(<enderio:block_power_monitor>);
recipes.addShaped(<enderio:block_power_monitor>, [
  [<ore:ingotElectricalSteel>, <enderio:item_conduit_probe>, <ore:ingotElectricalSteel>],
  [<ore:ingotElectricalSteel>, <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>, <ore:ingotElectricalSteel>],
  [<ore:ingotElectricalSteel>, <enderio:item_power_conduit>, <ore:ingotElectricalSteel>]]);

// Dark Steel Upgrade Recycling
mods.nuclearcraft.DecayHastener.addRecipe(<ore:upgradeDarkSteel>, <enderio:item_dark_steel_upgrade>, 2.0, 2.0);

// Dark Steel Upgrade Expensive, Thermal
mods.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_dark_steel_upgrade>, <enderio:block_alloy:6>, <minecraft:clay>, 25000);

// Lava Heat Exchanger
val machineCaseVariant = <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>;
recipes.remove(<enderio:block_lava_generator>);
recipes.addShaped(<enderio:block_lava_generator>, [
  [<ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>],
  [<ore:ingotBrickNetherGlazed>, machineCaseVariant, <ore:ingotBrickNetherGlazed>],
  [<ore:ingotBrickNetherGlazed>, <enderio:block_tank>, <ore:ingotBrickNetherGlazed>]]);

// Nethercotta
mods.immersiveengineering.ArcFurnace.addRecipe(<enderio:item_material:72>, <ore:ingotBrickNether>,
  <immersiveengineering:material:7>, 20 * 4, 2560, [<ore:cropNetherWart> * 4, <ore:clay> * 6], 'Alloying');

// Remake binder
recipes.remove(<enderio:item_material:22> * 8);
makeEx(<enderio:item_material:22> * 24, [
  [<ore:dust>, <ore:dustEndstone>, <ore:dust>],
  [<ore:dustClay>, LiquidIngr('sand'), <ore:dustClay>],
  [<ore:dust>, <ore:dustEndstone>, <ore:dust>]]);

// And remake binder as compost
furnace.remove(<enderio:item_material:4>);
mods.actuallyadditions.Compost.addRecipe(<enderio:item_material:4>, <quark:quilted_wool:8>, <enderio:item_material:22>, <biomesoplenty:dirt:2>);

// Simplifi Niard
recipes.remove(<enderio:block_niard>);
recipes.addShaped(<enderio:block_niard>, [
  [<immersiveengineering:metal_device1:6>, <enderio:block_tank>, <immersiveengineering:metal_device1:6>],
  [<ore:craftingPiston>, <ore:chassis>, <ore:craftingPiston>],
  [<ore:ingotFakeIron>, <ore:barsIron>, <ore:ingotFakeIron>]]);

// Compat of nano glowstone
scripts.process.crush(<enderio:item_material:76>, <enderio:block_holier_fog> * 2, 'only: Macerator AACrusher AEGrinder crushingBlock',
  [<enderio:block_holier_fog> * 2, <minecraft:clay_ball>, <minecraft:glowstone_dust>], [0.6f, 0.1f, 0.1f]);

// Compunent for nano-glowstone compat
scripts.process.alloy([<minecraft:glowstone_dust>, <minecraft:clay_ball>], <enderio:item_material:76> * 2, 'except: alloySmelter ArcFurnace');

// Harder Vibrant Alloy
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_alloy_ingot:1>, <minecraft:ender_pearl>);
scripts.process.alloy([<ore:ingotEnergeticAlloy>, <extendedcrafting:material:49>], <enderio:item_alloy_ingot:2> * 2, 'ONLY: induction alloySmelter');
scripts.process.alloy([<enderio:block_alloy:1>, <extendedcrafting:material:48>], <enderio:block_alloy:2> * 2, 'only: AdvRockArc');

// Energetic Alloy Block
scripts.process.alloy([<minecraft:redstone_block>, <minecraft:glowstone_dust> * 9, <minecraft:gold_block>], <enderio:block_alloy:1>, 'only: AdvRockArc');

// Remove alloy recipes made in High Oven
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:1>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:2>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:3>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:4>); // conductive Iron
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:5>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:6>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:7>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:8>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:9> * 3);

val fake_iron_variations = 
<thermalfoundation:material:1>   | <thermalfoundation:material:64>         | <thermalfoundation:material:65>  |
<thermalfoundation:material:66>  | <thermalfoundation:material:67>         | <thermalfoundation:material:68>  |
<thermalfoundation:material:69>  | <thermalfoundation:material:70>         | <thermalfoundation:material:71>  |
<thermalfoundation:material:72>  | <astralsorcery:itemcraftingcomponent:2> | <mekanism:dust:2>                |
<nuclearcraft:dust:3>            | <nuclearcraft:dust:5>                   | <nuclearcraft:dust:7>            |
<nuclearcraft:compound:2>        | <psi:material>                          | <thermalfoundation:material:96>  |
<thermalfoundation:material:97>  | <thermalfoundation:material:98>         | <thermalfoundation:material:99>  |
<thermalfoundation:material:100> | <thermalfoundation:material:101>        | <thermalfoundation:material:102> |
<thermalfoundation:material:103>;

// EnderIO simple alloys
solution([<ore:dustBedrock>, fake_iron_variations], [<liquid:iron> * 72], [<liquid:construction_alloy> * 216], [0.5, 1, 2700], 'only: highoven');
solution([<ore:dustBedrock>, <ore:dustEndstone>, <ore:nuggetTungsten>], [<liquid:dark_steel> * 144], [<liquid:end_steel> * 144], [0.5, 1, 1, 5500], 'only: highoven');
solution([<ore:dustBedrock>, <ore:dustRedstone>], [<liquid:iron> * 144], [<liquid:conductive_iron> * 144], [0.5, 1, 4200], 'only: highoven');

// Fake iron -> Steel
mods.mekanism.infuser.addRecipe('CARBON', 10, <enderio:item_alloy_ingot:9>, <mekanism:enrichediron>);

// Fake Iron remove melting conversions
mods.tconstruct.Melting.removeRecipe(<fluid:iron>, <immersiveengineering:conveyor>.withTag({ conveyorType: 'immersiveengineering:conveyor' }));
mods.tconstruct.Melting.removeRecipe(<fluid:iron>, <iceandfire:chain_link>);
mods.tconstruct.Melting.removeRecipe(<fluid:iron>, <immersiveengineering:drillhead:1>);

// Oxidiser
val ox as IIngredient = <ore:itemInfinityGoop>; // Infinity reagent

// EnderIO hard alloys
solution([ox, <mysticalagriculture:crafting:28>], [<liquid:gold> * 144], [<liquid:soularium> * 144], [0.5, 1, 0.25, 7600], 'only: highoven');
solution([ox, <ore:itemSilicon>], [<liquid:steel> * 144], [<liquid:electrical_steel> * 144], [0.5, 1, 0.25, 4500], 'only: highoven');
solution([ox, <ore:dustEnergetic>], [<liquid:gold> * 144], [<liquid:energetic_alloy> * 144], [0.5, 1, 0.25, 5400], 'only: highoven');
solution([ox, <extendedcrafting:material:49>], [<liquid:energetic_alloy> * 144], [<liquid:vibrant_alloy> * 144], [0.5, 1, 0.25, 8100], 'only: highoven');
solution([ox, <ore:dustRedstone>], [<liquid:tin> * 144], [<liquid:redstone_alloy> * 144], [0.5, 1, 0.25, 5400], 'only: highoven');
solution([ox, <ore:dustEnderEye>], [<liquid:iron> * 144], [<liquid:pulsating_iron> * 144], [0.5, 1, 0.25, 8200], 'only: highoven');

// Induction Smelter Energetic alloy recipe
scripts.process.alloy([<ore:ingotGold>, <ore:dustEnergetic>], <enderio:item_alloy_ingot:1>, 'only: Induction');

// Cheaper conduit facades
recipes.removeByRecipeName('enderio:conduit_facade_transparent');
val BDR = <ore:itemConduitBinder>;
recipes.addShaped(<enderio:item_conduit_facade:2> * 8, [
  [BDR, BDR, BDR],
  [BDR, <ore:fusedQuartz>, BDR],
  [BDR, BDR, BDR]]);

recipes.removeByRecipeName('enderio:conduit_facade');
recipes.addShaped(<enderio:item_conduit_facade> * 8, [
  [BDR, BDR, BDR],
  [BDR, null, BDR],
  [BDR, BDR, BDR]]);

// End Steel process
scripts.process.alloy([<ore:ingotDarkSteel>, <endreborn:wolframium_nugget>, <ore:endstone>], <ore:ingotEndSteel>.firstItem, 'except: alloySmelter');
scripts.process.alloy([<ore:blockDarkSteel>, <endreborn:item_ingot_wolframium>, <ore:compressed1xEndStone>], <ore:blockEndSteel>.firstItem, 'only: advrockarc');

// Excess ender dust recipe
recipes.removeByRecipeName('enderio:ender_dust');

# [Stirling Generator] from [Industrial Machine Chassis][+5]
craft.remake(<enderio:block_stirling_generator>, ["pretty",
  "¤ G ¤",
  "E M E",
  "☼ 3 ☼"], {
  "¤": <ore:gearEnergized>,                # Energized Bimetal Gear
  "G": <advgenerators:turbine_controller>, # Gas Turbine controller
  "E": <mekanism:electrolyticcore>,        # Electrolytic Core
  "M": <ore:itemMachineChassi>,            # Industrial Machine Chassis
  "☼": <ore:gearDark>,                     # Dark Bimetal Gear
  "3": <opencomputers:print>,              # 3D Print
});

# [SAG Mill] from [Industrial Machine Chassis][+4]
craft.remake(<enderio:block_sag_mill>, ["pretty",
  "¤ □ ¤",
  "□ M □",
  "☼ 3 ☼"], {
  "¤": <ore:gearEnergized>,     # Energized Bimetal Gear
  "□": <tconstruct:large_plate>.withTag({Material: "flint"}), # Flint Large Plate
  "M": <ore:itemMachineChassi>, # Industrial Machine Chassis
  "☼": <ore:gearDark>,          # Dark Bimetal Gear
  "3": <opencomputers:print>,   # 3D Print
});

# [Alloy Smelter] from [Industrial Machine Chassis][+4]
craft.remake(<enderio:block_alloy_smelter>, ["pretty",
  "¤ H ¤",
  "H M H",
  "☼ 3 ☼"], {
  "¤": <ore:gearEnergized>,                # Energized Bimetal Gear
  "H": <tcomplement:high_oven_controller>, # High Oven Controller
  "M": <ore:itemMachineChassi>,            # Industrial Machine Chassis
  "☼": <ore:gearDark>,                     # Dark Bimetal Gear
  "3": <opencomputers:print>,              # 3D Print
});

// [Simple_Inventory_Charger] from [LV_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger_simple>, ['D', 'L', '▬'], {
  'D': <ore:nuggetDarkSteel>, // Dark Steel Nugget
  'L': <immersiveengineering:metal_device0>, // LV Capacitor
  '▬': <ore:ingotLead>,
});

// [Basic_Inventory_Charger] from [MV_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger_basic>, ['E', 'M', '▬'], {
  'E': <ore:nuggetElectricalSteel>, // Electrical Steel Nugget
  'M': <immersiveengineering:metal_device0:1>, // MV Capacitor
  '▬': <ore:ingotLead>,
});

// [Inventory_Charger] from [HV_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger>, ['♥', 'H', '▬'], {
  '♥': <ore:nuggetRedstoneAlloy>, // Redstone Alloy Nugget
  'H': <immersiveengineering:metal_device0:2>, // HV Capacitor
  '▬': <ore:ingotLead>,
});

// [Vibrant_Inventory_Charger] from [Basic_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger_vibrant>, ['P', 'B', '▬'], {
  'P': <ore:nuggetPulsatingIron>, // Pulsating Iron Nugget
  'B': <enderio:item_basic_capacitor>, // Basic Capacitor
  '▬': <ore:ingotLead>,
});

// [Fluid Filter] from [Flopper][+1]
craft.remake(<enderio:item_fluid_filter>, ['pretty',
  '  p  ',
  'p F p',
  '  p  '], {
  'p': <ore:paper>, // Paper
  'F': <flopper:flopper>, // Flopper
});

// [Omnivoir] from [Black Quartz][+1]
craft.remake(<enderio:block_omni_reservoir> * 4, ['pretty',
  'S S S',
  'S ⌃ S',
  'S S S'], {
  '⌃': <ore:gemQuartzBlack>,
  'S': <tconstruct:materials>,
});

// Omnivoir fast alt
scripts.process.alloy([<ore:gemQuartzBlack>], <enderio:block_omni_reservoir> * 4, 'only: alloySmelter');

// [Energy Gauge] from [Omnivoir][+2]
craft.remake(<enderio:block_gauge>, ['pretty',
  '  ▲  ',
  '▬ O ▬'], {
  '▲': <ore:dustBedrock>, // Grains of Infinity
  '▬': <ore:ingotFakeIron>, // Iron Ingot
  'O': <enderio:block_omni_reservoir>, // Omnivoir
});

// [Endervoir] from [Molten Lapis]
recipes.remove(<enderio:block_reservoir>);
mods.tconstruct.Casting.addBasinRecipe(<enderio:block_reservoir>, <enderio:block_omni_reservoir>, <liquid:lapis>, 666, true);
scripts.process.fill(<enderio:block_omni_reservoir>, <liquid:lapis> * 666, <enderio:block_reservoir>, 'only: NCInfuser Transposer');

// [Black Paper]*8 from [Ink Sac][+1]
craft.remake(<enderio:item_material:77> * 8, ['pretty',
  'p p p',
  'p d p',
  'p p p'], {
  'p': <ore:paper>, // Paper
  'd': <ore:dyeBlack>, // Ink Sac
});

// Conflicts
recipes.removeByRecipeName('enderio:self_resetting_lever_300_seconds_inverted');

// Harder to compete with all other item transfer methods
// [Item Conduit*8] from [Vibrant Alloy Nugget][+1]
craft.remake(<enderio:item_item_conduit> * 8, ['pretty',
  'C C C',
  '‚ ‚ ‚',
  'C C C'], {
  'C': <ore:itemConduitBinder>, // Conduit Binder
  '‚': <ore:nuggetVibrantAlloy>, // Vibrant Alloy Nugget
});

// Cheaper cause vanilla recipe require Vibrant Alloy
// [Dark Steel Upgrade "Empowered"] from [Pulsating Crystal][+1]
craft.reshapeless(<enderio:item_dark_steel_upgrade:1>.withTag({ 'enderio:dsu': 'enderio:energyupgrade' }),
  'B*', {
    'B': <enderio:item_dark_steel_upgrade>, // Blank Dark Steel Upgrade
    '*': <ore:itemPulsatingCrystal>, // Pulsating Crystal
  });

// Add recipe to use in some AA crafts
// [Organic Brown Dye] from [Crushed Black Quartz][+3]
mods.rt.RandomThingsTweaker.addImbuingRecipe(
  <forestry:refractory_wax>, // Refractory Wax
  <actuallyadditions:item_misc:21>, // Biomass
  <actuallyadditions:item_dust:7>, // Crushed Black Quartz
  <forestry:mulch>,
  <enderio:item_material:49>
);

// Magic-only alt recipes
for ingr, amount in {
  <industrialforegoing:pink_slime>: 2,
  <betteranimalsplus:goose_egg>: 1,
  <betteranimalsplus:turkey_egg>: 1,
  <betteranimalsplus:pheasant_egg>: 1,
} as int[IIngredient] {
  mods.bloodmagic.AlchemyTable.addRecipe(<enderio:item_material:48> * amount, [
    <enderio:item_material:46> * 6,
    <ore:ingotUranium238>,
    ingr,
    ], 300, 40, 2);
  mods.bloodmagic.AlchemyTable.addRecipe(<enderio:item_material:50> * amount, [
    <thermalfoundation:material:768> * 3, ingr], 300, 40, 2);
}
mods.bloodmagic.AlchemyTable.addRecipe(<enderio:item_material:49>, [
  <enderio:item_material:47> * 4,
  <forestry:mulch>,
  <actuallyadditions:item_misc:21>,
], 300, 40, 2);

// [Pulsating Crystal] from [Biome Essence][+1]
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_material:14>);
mods.tconstruct.Casting.removeTableRecipe(<enderio:item_material:14>);
craft.remake(<enderio:item_material:14>, ['pretty',
  '‚ ‚ ‚',
  '‚ B ‚',
  '‚ ‚ ‚'], {
  'B': <biomesoplenty:biome_essence>, // Biome Essence
  '‚': <ore:nuggetPulsatingIron>, // Pulsating Iron Nugget
});

// Remove Death urn (we have special mod for this. Urn not as handy)
Purge(<enderio:item_material:81>);
Purge(<enderio:block_death_pouch>).furn();

// Remove unused Cobalt and Ardite dust
Purge(<enderio:item_material:30>);
Purge(<enderio:item_material:31>);

// [Experience Rod] from [Pulsating Crystal][+1]
craft.remake(<enderio:item_xp_transfer>, ['pretty',
  '    *',
  '  ▬  ',
  '▬    '], {
  '*': <ore:itemPulsatingCrystal>, // Pulsating Crystal
  '▬': <ore:ingotPulsatingIron>, // Pulsating Iron Ingot
});

// [Experience Obelisk] from [Pressurized Fluid Tank][+3]
craft.remake(<enderio:block_experience_obelisk>, ['pretty',
  '  /  ',
  '□ P □',
  'C C C'], {
  '/': <enderio:item_xp_transfer>, // Experience Rod
  '□': <tconstruct:large_plate>.withTag({ Material: 'osgloglas' }), // Osgloglas Large Plate
  'P': <enderio:block_tank:1>, // Pressurized Fluid Tank
  'C': <ore:itemChassiParts>, // Machine Parts
});

// [Weather Obelisk] from [Rainmaker][+3]
craft.remake(<enderio:block_weather_obelisk>, ['pretty',
  '  R  ',
  '□ a □',
  'S S S'], {
  'R': <randomthings:rainshield>, // Rain Shield
  '□': <tconstruct:large_plate>.withTag({ Material: 'osgloglas' }), // Osgloglas Large Plate
  'a': <forestry:rainmaker>, // Rainmaker
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
});

// [Inhibitor Obelisk] from [Infinity Bimetal Gear][+3]
craft.remake(<enderio:block_inhibitor_obelisk>, ['pretty',
  '  E  ',
  '□ ¤ □',
  'S S S'], {
  'E': <darkutils:ender_tether>, // Ender Tether
  '□': <tconstruct:large_plate>.withTag({ Material: 'osgloglas' }), // Osgloglas Large Plate
  '¤': <ore:gearIronInfinity>, // Infinity Bimetal Gear
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
});

// [Attractor Obelisk] from [Infinity Bimetal Gear][+3]
craft.remake(<enderio:block_attractor_obelisk>, ['pretty',
  '  *  ',
  '□ ¤ □',
  'S S S'], {
  '*': <ore:itemAttractorCrystal>, // Enticing Crystal
  '□': <tconstruct:large_plate>.withTag({ Material: 'osgloglas' }), // Osgloglas Large Plate
  '¤': <ore:gearIronInfinity>, // Infinity Bimetal Gear
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
});

// [Aversion Obelisk] from [Powered Lantern][+3]
craft.remake(<enderio:block_aversion_obelisk>, ['pretty',
  '  T  ',
  '□ P □',
  'S S S'], {
  'T': <enderio:block_enderman_skull:2>, // Tormented Enderman Head
  '□': <tconstruct:large_plate>.withTag({ Material: 'osgloglas' }), // Osgloglas Large Plate
  'P': <immersiveengineering:metal_device1:4>, // Powered Lantern
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
});

// [Relocator Obelisk] from [Fan][+3]
craft.remake(<enderio:block_relocator_obelisk>, ['pretty',
  '  C  ',
  '□ F □',
  'S S S'], {
  'C': <contenttweaker:compressed_gravisand>, // Compressed Gravisand
  '□': <tconstruct:large_plate>.withTag({ Material: 'osgloglas' }), // Osgloglas Large Plate
  'F': <cyclicmagic:fan>, // Fan
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
});

// [Vibrant Crystal] from [Vibrant Alloy Ingot][+1]
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_material:15>);
mods.tconstruct.Casting.removeTableRecipe(<enderio:item_material:15>);
craft.remake(<enderio:item_material:15>, ['pretty',
  '  M  ',
  'M ▬ M',
  '  M  '], {
  '▬': <ore:ingotVibrantAlloy>, // Vibrant Alloy Ingot
  'M': <tconstruct:materials:19>, // Mending Moss
});

// [Photovoltaic Composite] from [Silicon][+2]
craft.reshapeless(<enderio:item_material:38>, '▲▲▲©S©▲▲▲', {
  '▲': <ore:dustLapis>, // Lapis Lazuli Dust
  'S': <ore:ingotSilicon>, // Silicon
  '©': <randomthings:ingredient:13>,
});

// Cheaper to make teleport stations easier
# [Telepad Block] from [Pulsating Crystal][+2]
craft.remake(<enderio:block_tele_pad>, ["pretty",
  "■ C ■",
  "C * C",
  "■ C ■"], {
  "■": <ore:fusedQuartz>, # Fused Quartz
  "C": <ore:itemConduitBinder>, # Conduit Binder
  "*": <ore:itemPulsatingCrystal>, # Pulsating Crystal
});

// Low-level machines (original in Alloy Smelter)
scripts.process.compress(<ore:itemPowderPhotovoltaic> * 4, <enderio:item_material:3>, 'Except: Compressor');
mods.mekanism.compressor.addRecipe(<ore:itemPowderPhotovoltaic> * 4, <enderio:item_material:3>);
mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:3>, <ore:itemPowderPhotovoltaic> * 4, <immersiveengineering:mold:0>, 2000);
mods.qmd.target_chamber.addRecipe(<ore:itemPowderPhotovoltaic>, null, (<particle:boron_ion> * 100000) ^ 2000, <enderio:item_material:3>, null, null, null, null, 10000, 1.0, 0);

// Cheaper to match other solar panels
// [Simple Photovoltaic Cell] from [Infinity Bimetal Gear][+3]
craft.remake(<enderio:block_solar_panel>, ['pretty',
  '‚ ‚ ‚',
  '□ □ □',
  '▲ ¤ ▲'], {
  '□': <ore:itemPlatePhotovoltaic>, // Photovoltaic Plate
  '▲': <ore:dustBedrock>, // Grains of Infinity
  '¤': <ore:gearIronInfinity>, // Infinity Bimetal Gear
  '‚': <ore:nuggetElectricalSteel>, // Electrical Steel Nugget
});

// Remove [Ender Pearl Powder] grinding recipes
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:ender_pearl>);
mods.appliedenergistics2.Grinder.removeRecipe(<thermalfoundation:material:895>);
scripts.process.crush(<ore:enderpearl>, <appliedenergistics2:material:46>, 'Except: Pulverizer PulseCentrifuge', null, null);

// [block_fused_quartz] from [Block_of_Quartz][+2]
craft.shapeless(<enderio:block_fused_quartz> * 8, 'ABBBBBBBB', {
  A: <contenttweaker:empowered_phosphor>,
  B: <ore:blockQuartz>,
});

// [Electric Light] from [Glowstone Dust][+3]
craft.remake(<enderio:block_electric_light>, ['pretty',
  '■ ■ ■',
  'S ▲ S',
  'S ‚ S'], {
  '■': <ore:fusedQuartz>, // Fused Quartz
  '▲': <ore:dustGlowstone>, // Glowstone Dust
  'S': <ore:ingotSilicon>, // Silicon
  '‚': <ore:nuggetElectricalSteel>, // Electrical Steel Nugget
});

// [Wireless Light] from [Pulsating Iron Ingot][+1]
craft.reshapeless(<enderio:block_electric_light:4>,
  'E▬', {
    'E': <enderio:block_electric_light>, // Electric Light
    '▬': <ore:ingotPulsatingIron>, // Pulsating Iron Ingot
  });
recipes.removeByRecipeName('enderio:light_wireless_inverted_upgrade');
recipes.addShapeless('light_wireless_inverted_upgrade', <enderio:block_electric_light:5>, [<enderio:block_electric_light:1>, <ore:ingotPulsatingIron>]);

// [Inventory Sensor] from [Emeradic Crystal][+4]
craft.remake(<enderio:block_inventory_panel_sensor>, ['pretty',
  '▬ R ▬',
  '♥ * ♥',
  '▬ ▼ ▬'], {
  'R': <ore:itemRemoteAwarenessUpgrade>, // Remote Awareness Upgrade
  '♥': <ore:ingotRedstoneAlloy>, // Redstone Alloy Ingot
  '*': <ore:crystalEmeraldic>, // Emeradic Crystal
  '▬': <ore:ingotElectricalSteel>, // Electrical Steel Ingot
  '▼': <minecraft:comparator>, // Redstone Comparator
});

// [Tiny Inventory System Storage] from [Oak Chest][+2]
recipes.remove(<enderio:block_inventory_chest_tiny>);
craft.make(<enderio:block_inventory_chest_tiny>.withTag( {"enderio:energy": 1000000000} ), ['pretty',
  '  R  ',
  'S c S'], {
  'R': <ore:ingotSilicon>,
  'S': <ic2:casing:4>,
  'c': <ore:chest>, // Oak Chest
});

// [Inventory Panel] from [Storage Terminal][+3]
craft.remake(<enderio:block_inventory_panel>, ['pretty',
  'R M R',
  'M S M',
  'R P R'], {
  'R': <ore:itemRemoteAwarenessUpgrade>, // Remote Awareness Upgrade
  'M': <tconstruct:materials:19>, // Mending Moss
  'S': <integratedterminals:part_terminal_storage_item>, // Storage Terminal
  'P': <enderio:block_tank:1>, // Pressurized Fluid Tank
});

// [Inventory Panel Remote] from [Inventory Panel][+2]
craft.remake(<enderio:item_inventory_remote>, ['pretty',
  '    □',
  '□ I □',
  '□ T □'], {
  '□': <minecraft:heavy_weighted_pressure_plate>, // Weighted Pressure Plate
  'T': <enderio:block_travel_anchor>, // Travel Anchor
  'I': <enderio:block_inventory_panel>, // Inventory Panel
});

// New Machine Part recipes (cheaper then previous)
recipes.remove(<enderio:item_material:69>);
recipes.remove(<enderio:item_material:2>);
recipes.remove(<enderio:item_material:68>);
for block, result in {
  <ic2:resource:12>: { <enderio:item_material:69>: 8 },
  <ic2:resource:13>: { <enderio:item_material:69>: 16 },

  <actuallyadditions:block_misc:9>: { <enderio:item_material:2>: 10 },
  <mekanism:basicblock:8>         : { <enderio:item_material:2>: 16 },

  <libvulpes:structuremachine>    : { <enderio:item_material:68>: 10 },
  <appliedenergistics2:controller>: { <enderio:item_material:68>: 16 },
} as int[IItemStack][IItemStack] {
  for output, amount in result {
    mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(output * amount, block);
  }
}

// [Enhanced Dye Blend] from [Grains of Piezallity][+1]
recipes.remove(<enderio:item_material:67>);
scripts.do.expire_in_block.set(<ore:itemPulsatingPowder>, { 'cyclicmagic:fire_dark': <enderio:item_material:67> });

// [Conduit Binder]*24 from [Crushed End Stone]*2[+3]
scripts.processUtils.avdRockXmlRecipe('Crystallizer', [
  <ore:dust> * 20, // Dust
  <ic2:dust:1> * 5, // Clay Dust
  <nuclearcraft:gem_dust:11> * 5, // Crushed End Stone
], [
  <fluid:sand> * 5000,
], [
  <enderio:item_material:4> * 64,
  <enderio:item_material:4> * 56,
], null);

// Cheaper to let players use it earlier
// [Totemic Capacitor] from [MV Capacitor][+2]
craft.remake(<enderio:item_capacitor_totemic>, ['pretty',
  '  T  ',
  '▲ M ▲',
  '  ▲  '], {
  'T': <minecraft:totem_of_undying>, // Totem of Undying
  '▲': <ore:dustBedrock>, // Grains of Infinity
  'M': <immersiveengineering:metal_device0:1>, // MV Capacitor
});

// [Simple Wired Charger] from [Charged Creeper Chunk][+2]
craft.remake(<enderio:block_simple_wired_charger>, ['pretty',
  '⌂ ░ ⌂',
  '░ ∩ ░',
  '⌂ ░ ⌂'], {
  '⌂': <ic2:casing:4>, // Lead Item Casing
  '░': <ore:cobblestone>, // Cobblestone
  '∩': <rats:charged_creeper_chunk>, // Charged Creeper Chunk
});

// [Wired Charger] from [Simple Wired Charger][+1]
craft.remake(<enderio:block_wired_charger>, ['pretty',
  '  S  ',
  'S i S',
  '  S  '], {
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
  'i': <enderio:block_simple_wired_charger>, // Simple Wired Charger
});

// [Wired Charger] from [Charged Creeper Chunk][+2]
craft.remake(<enderio:block_wired_charger>, ['pretty',
  '⌂ S ⌂',
  'S ∩ S',
  '⌂ S ⌂'], {
  '⌂': <ic2:casing:4>, // Lead Item Casing
  'S': <ore:itemSimpleChassiParts>, // Simple Machine Parts
  '∩': <rats:charged_creeper_chunk>, // Charged Creeper Chunk
});

// [Enhanced Wired Charger] from [Wired Charger][+1]
craft.remake(<enderio:block_enhanced_wired_charger>, ['pretty',
  '  C  ',
  'C W C',
  '  C  '], {
  'C': <ore:itemChassiParts>, // Machine Parts
  'W': <enderio:block_wired_charger>, // Wired Charger
});

// [Enhanced Wired Charger] from [Charged Creeper Chunk][+2]
craft.remake(<enderio:block_enhanced_wired_charger>, ['pretty',
  'S C S',
  'C ∩ C',
  'S C S'], {
  'S': <ore:sheetSteel>, // Steel Sheet
  'C': <ore:itemChassiParts>, // Machine Parts
  '∩': <rats:charged_creeper_chunk>, // Charged Creeper Chunk
});

// [Enhanced Alloy Smelter] from [Alloy Smelter][+5]
mods.thaumcraft.Infusion.registerRecipe(
  'block_enhanced_alloy_smelter', // Name
  'INFUSION', // Research
  <enderio:block_enhanced_alloy_smelter>, // Output
  7, // Instability
  [<aspect:amogus> * 50, Aspect.caeles * 50],
  <enderio:block_alloy_smelter>, // Central Item
  Grid(['pretty',
    '  E  ',
    'E   E',
    '  n  '], {
    'E': <ore:itemEnhancedChassiParts>, // Enhanced Machine Parts
    'n': <ore:itemEnhancedMachineChassi>, // Enhanced Machine Chassis
  }).spiral(1));

// [Enhanced Combustion Generator] from [Combustion Generator][+5]
mods.thaumcraft.Infusion.registerRecipe(
  'block_enhanced_combustion_generator', // Name
  'INFUSION', // Research
  <enderio:block_enhanced_combustion_generator>, // Output
  7, // Instability
  [<aspect:amogus> * 50, Aspect.caeles * 50],
  <enderio:block_combustion_generator>, // Central Item
  Grid(['pretty',
    '  E  ',
    'E   E',
    '  n  '], {
    'E': <ore:itemEnhancedChassiParts>, // Enhanced Machine Parts
    'n': <ore:itemEnhancedMachineChassi>, // Enhanced Machine Chassis
  }).spiral(1));

// [Enhanced SAG Mill] from [SAG Mill][+5]
mods.thaumcraft.Infusion.registerRecipe(
  'block_enhanced_sag_mill', // Name
  'INFUSION', // Research
  <enderio:block_enhanced_sag_mill>, // Output
  7, // Instability
  [<aspect:amogus> * 50, Aspect.caeles * 50],
  <enderio:block_sag_mill>, // Central Item
  Grid(['pretty',
    '  E  ',
    'E   E',
    '  n  '], {
    'E': <ore:itemEnhancedChassiParts>, // Enhanced Machine Parts
    'n': <ore:itemEnhancedMachineChassi>, // Enhanced Machine Chassis
  }).spiral(1));

// [The Enhanced Vat] from [The Vat][+5]
mods.thaumcraft.Infusion.registerRecipe(
  'block_enhanced_vat', // Name
  'INFUSION', // Research
  <enderio:block_enhanced_vat>, // Output
  7, // Instability
  [<aspect:amogus> * 50, Aspect.caeles * 50],
  <enderio:block_vat>, // Central Item
  Grid(['pretty',
    '  E  ',
    'E   E',
    '  n  '], {
    'E': <ore:itemEnhancedChassiParts>, // Enhanced Machine Parts
    'n': <ore:itemEnhancedMachineChassi>, // Enhanced Machine Chassis
  }).spiral(1));

// [Enhanced Wireless Charger] from [Wireless Charger][+5]
mods.thaumcraft.Infusion.registerRecipe(
  'block_enhanced_wireless_charger', // Name
  'INFUSION', // Research
  <enderio:block_enhanced_wireless_charger>, // Output
  7, // Instability
  [<aspect:amogus> * 50, Aspect.caeles * 50],
  <enderio:block_normal_wireless_charger>, // Central Item
  Grid(['pretty',
    '  E  ',
    'E   E',
    '  n  '], {
    'E': <ore:itemEnhancedChassiParts>, // Enhanced Machine Parts
    'n': <ore:itemEnhancedMachineChassi>, // Enhanced Machine Chassis
  }).spiral(1));

// [Grains of Prescience] from [Prescient Crystal]
scripts.process.crush(<ore:itemPrecientCrystal>, <enderio:item_material:34>, 'only: eu2Crusher AACrusher');

// [Grains of Vibrancy] from [Vibrant Crystal]
scripts.process.crush(<ore:itemVibrantCrystal>, <enderio:item_material:35>, 'only: eu2Crusher AACrusher');

// [Grains of Piezallity] from [Pulsating Crystal]
scripts.process.crush(<ore:itemPulsatingCrystal>, <enderio:item_material:36>, 'only: eu2Crusher AACrusher');

// [Grains of the End] from [Ender Crystal]
scripts.process.crush(<ore:itemEnderCrystal>, <enderio:item_material:37>, 'only: eu2Crusher AACrusher');

// The Vat early alternatives
function addBrewAlt(fluid as ILiquidStack, ingrs as IIngredient[], output as string, extraIngr as IIngredient = null) as void {
  mods.rustic.Condenser.addRecipe(
    <rustic:fluid_bottle>.withTag({ Fluid: { FluidName: output, Amount: 1000 } }),
    ingrs, extraIngr, <minecraft:glass_bottle>, fluid, 40
  );
}

addBrewAlt(<fluid:mead> * 2000, [<additionalcompression:meatporkchop_compressed>, <minecraft:sugar>], 'nutrient_distillation');
addBrewAlt(<fluid:short.mead> * 2000, [<additionalcompression:meatporkchop_compressed>, <minecraft:sugar>], 'nutrient_distillation');
addBrewAlt(<fluid:mead> * 2000, [<minecraft:skull:2>, <minecraft:sugar>], 'nutrient_distillation');
addBrewAlt(<fluid:short.mead> * 2000, [<minecraft:skull:2>, <minecraft:sugar>], 'nutrient_distillation');
addBrewAlt(<fluid:milk> * 8000, [<rats:assorted_vegetables>, <additionalcompression:dustsugar_compressed:1>], 'hootch');
addBrewAlt(<fluid:hootch> * 2000, [<minecraft:blaze_powder>, <minecraft:redstone>], 'fire_water');
addBrewAlt(<fluid:fire_water> * 2000, [<iceandfire:dread_shard>, <iceandfire:hydra_fang>, <iceandfire:shiny_scales>], 'syngas', <contenttweaker:blasted_coal>);

// Simple machines recycle
recipes.addShapeless(<enderio:item_material>, [<enderio:block_simple_furnace:*> | <enderio:block_simple_alloy_smelter:*> | <enderio:block_simple_stirling_generator:*> | <enderio:block_simple_sag_mill:*>]);

// Chemical Reactor alt recipes
val chemReactor = mods.advancedrocketry.RecipeTweaker.forMachine('ChemicalReactor');

chemReactor.builder().power(30000).timeRequired(25)
  .inputs(
    <fluid:short.mead> * 32000,
    <ore:itemPrecientPowder> * 2,
    <ore:itemEnderCrystalPowder> * 2,
    <ore:itemPulsatingPowder> * 4,
    <ore:itemSkull> * 16
  )
  .outputs(<fluid:vapor_of_levity> * 2000).build();

chemReactor.builder().power(30000).timeRequired(10)
  .inputs(
    <fluid:short.mead> * 32000,
    <ore:itemEnderCrystalPowder> * 2,
    <ore:itemPulsatingPowder> * 2,
    <minecraft:skull> * 1
  )
  .outputs(<fluid:ender_distillation> * 2000).build();

chemReactor.builder().power(30000).timeRequired(5)
  .inputs(
    <fluid:short.mead> * 2000,
    <minecraft:skull:2> * 2
  )
  .outputs(<fluid:nutrient_distillation> * 1000).build();

// EnderIO Liquids (Hootch line)
chemReactor.builder().power(30000).timeRequired(15)
  .inputs(
    <fluid:milk> * 32000,
    <minecraft:poisonous_potato> * 2,
    <minecraft:double_plant> * 2
  )
  .outputs(<fluid:liquid_sunshine> * 4000).build();

chemReactor.builder().power(30000).timeRequired(10)
  .inputs(
    <fluid:milk> * 32000,
    <minecraft:poisonous_potato> * 2,
    <ore:dustBlaze> * 2
  )
  .outputs(<fluid:fire_water> * 4000).build();

chemReactor.builder().power(30000).timeRequired(15)
  .inputs(
    <fluid:milk> * 32000,
    <minecraft:poisonous_potato> * 2,
    <ore:gunpowder> * 2
  )
  .outputs(<fluid:rocket_fuel> * 4000).build();

chemReactor.builder().power(30000).timeRequired(5)
  .inputs(
    <fluid:milk> * 32000,
    <minecraft:poisonous_potato> * 2,
    <ore:cropPotato> * 2
  )
  .outputs(<fluid:hootch> * 4000).build();

// EnderIO liquids (Cloud Seed line)
chemReactor.builder().power(30000).timeRequired(10)
  .inputs(
    <fluid:ice> * 800,
    <ore:dustSilver> * 6,
    <ore:ice> * 4
  )
  .outputs(<fluid:cloud_seed_concentrated> * 2500).build();

chemReactor.builder().power(30000).timeRequired(5)
  .inputs(
    <fluid:hot_spring_water> * 400
  )
  .outputs(<fluid:cloud_seed> * 2000).build();
