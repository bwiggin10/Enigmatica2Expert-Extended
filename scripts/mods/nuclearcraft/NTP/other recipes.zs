#modloaded nuclearcraft

import crafttweaker.item.IIngredient;

// elektron
scripts.process.alloy(
  [<ore:ingotMagnesium26>, <ore:ingotCobalt60>],
  <contenttweaker:elektron60_ingot> * 4,
  'except: kiln');

// recipes.addShapeless("elektron2block",<contenttweaker:elektron60_block>,[<ore:ingotElektron60>*9]);
recipes.addShapeless('block2elektron', <contenttweaker:elektron60_ingot> * 9, [<ore:blockElektron60>]);
val blocked = <ore:ingotElektron60>;
recipes.addShaped('elektron2blockshape', <contenttweaker:elektron60_block>,
  [[blocked, blocked, blocked],
    [blocked, blocked, blocked],
    [blocked, blocked, blocked]]);

// SiC-SiC CMC Recipes
// mods.nuclearcraft.Enricher.addRecipe(<ore:ingotSiliconCarbide>, <liquid:hydrogen>*1000, <liquid:sic_vapor>*1000);
// mods.nuclearcraft.Infuser.addRecipe(<nuclearcraft:alloy:13>, <liquid:sic_vapor>*1000, <ore:fiberSiliconCarbide>);
// mods.nuclearcraft.AlloyFurnace.addRecipe(<ore:fiberSiliconCarbide>*8, <ore:ingotExtreme>, <ore:ingotSiCSiCCMC>, 2.0, 4.0, 0.0);

// ultra light
recipes.addShaped('ncoutobladecore', <contenttweaker:blade_core>,
  [[<nuclearcraft:turbine_rotor_blade_neptunium>, <nuclearcraft:turbine_rotor_blade_plutonium>, <nuclearcraft:turbine_rotor_blade_americium>],
    [<contenttweaker:elektron60_ingot>, <ore:ingotHSLASteel>, <contenttweaker:elektron60_ingot>],
    [<nuclearcraft:turbine_rotor_blade_curium>, <nuclearcraft:turbine_rotor_blade_berkelium>, <nuclearcraft:turbine_rotor_blade_californium>]]);

recipes.addShaped('ncoutosteelmould', <contenttweaker:steel_mould> * 4,
  [[<nuclearcraft:turbine_rotor_blade_elektron90>, <contenttweaker:elektron60_ingot>, <nuclearcraft:turbine_rotor_blade_elektron90>],
    [<contenttweaker:elektron60_ingot>, <contenttweaker:blade_core>, <contenttweaker:elektron60_ingot>],
    [<nuclearcraft:turbine_rotor_blade_elektron90>, <contenttweaker:elektron60_ingot>, <nuclearcraft:turbine_rotor_blade_elektron90>]]);

recipes.addShaped('ncoutoalloymould', <contenttweaker:alloy_mould> * 4,
  [[<nuclearcraft:turbine_rotor_blade_elektron192>, <contenttweaker:elektron60_ingot>, <nuclearcraft:turbine_rotor_blade_elektron192>],
    [<contenttweaker:elektron60_ingot>, <contenttweaker:blade_core>, <contenttweaker:elektron60_ingot>],
    [<nuclearcraft:turbine_rotor_blade_elektron192>, <contenttweaker:elektron60_ingot>, <nuclearcraft:turbine_rotor_blade_elektron192>]]);

recipes.addShaped('ncoutosicmould', <contenttweaker:sic_mould> * 4,
  [[<nuclearcraft:turbine_rotor_blade_elektron231>, <contenttweaker:elektron60_ingot>, <nuclearcraft:turbine_rotor_blade_elektron231>],
    [<contenttweaker:elektron60_ingot>, <contenttweaker:blade_core>, <contenttweaker:elektron60_ingot>],
    [<nuclearcraft:turbine_rotor_blade_elektron231>, <contenttweaker:elektron60_ingot>, <nuclearcraft:turbine_rotor_blade_elektron231>]]);

mods.qmd.target_chamber.addRecipe(<contenttweaker:steel_mould>, null, ((<particle:proton> * 100000) ^ 10000) ~ 10.0, <nuclearcraft:turbine_rotor_blade_edelstahl>, null, <particle:proton>, <particle:neutron>, null, 11000, 0.5, -6000);
mods.qmd.target_chamber.addRecipe(<contenttweaker:alloy_mould>, null, ((<particle:proton> * 100000) ^ 10000) ~ 10.0, <nuclearcraft:turbine_rotor_blade_legierung>, null, <particle:proton>, <particle:neutron>, null, 11000, 0.5, -6000);
mods.qmd.target_chamber.addRecipe(<contenttweaker:sic_mould>, null, ((<particle:proton> * 100000) ^ 10000) ~ 10.0, <nuclearcraft:turbine_rotor_blade_matrix>, null, <particle:proton>, <particle:neutron>, null, 11000, 0.5, -6000);

val ttblades = [<contenttweaker:steel_mould>, <contenttweaker:alloy_mould>, <contenttweaker:sic_mould>, <contenttweaker:blade_core>] as IIngredient[];
for blade in ttblades {
  blade.addTooltip(format.italic('Crafting Ingredient.'));
}
// radiation

mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:elektron60_ingot>, 1.9e-6);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:elektron60_block>, 9.9e-6);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:blade_core>, 100.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:steel_mould>, 150.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:alloy_mould>, 150.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:sic_mould>, 150.0e-3);

mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_stator_elektron>, 1.9e-6);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_elektron90>, 3.4e-6);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_elektron192>, 1.0e-6);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_elektron231>, 41.0e-6);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_edelstahl>, 50.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_legierung>, 50.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_matrix>, 50.0e-3);

mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_stator_thorium>, 840.0e-9);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_stator_uranium>, 20.0e-9);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_neptunium>, 40.0e-9);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_plutonium>, 240.0e-9);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_americium>, 1.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_curium>, 1.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_berkelium>, 6.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_californium>, 30.0e-3);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:turbine_rotor_blade_copernicum>, 50.0e-6);
