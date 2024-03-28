#modloaded artisanworktables

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// Remove unused table types
// Other types removed in .cfg
for it in [
  <artisanworktables:worktable:9>,
  <artisanworktables:workstation:9>,
] as IItemStack[] {
  utils.rh(it);
}

// Remove grimoires (unused for now)
for it in itemUtils.getItemsByRegexRegistryName('artisanworktables:artisans_grimoire_.*') {
  utils.rh(it);
}

val list = {} as IIngredient[string];
list['◪'] = <ic2:fluid_cell>;
list['◽'] = <mekanism:transmitter:1>;
list['◩'] = <ic2:glass>;
list['▬'] = <rustic:retort_advanced>;
list['⩉'] = <ic2:te:132>;
list['◘'] = <ic2:crafting:15>;
list['◊'] = <immersiveengineering:material:8>;
list['ⱋ'] = <ore:logWood>;
list['▥'] = <thermalexpansion:augment:369>;
list['♰'] = <vaultopic:vice>;
list['ⰱ'] = <minecraft:brewing_stand>;
list['☒'] = <ic2:te:112>;
list['◧'] = <ore:workbench>;
list['◇'] = <nuclearcraft:part:12>;

craft.make(<artisanworktables:workshop:9>, ['pretty',
  '▬ ▥ ▬',
  '◪ ♰ ◪',
  '◪ ⰱ ◪'], list);

craft.make(<artisanautomation:automator_power_rf>, ['pretty',
  '⩉ ◘ ⩉',
  '◽ ☒ ◽',
  '◽ ◘ ◽'], list);

craft.make(<artisanautomation:automator>, ['pretty',
  '◩ ◩ ◩',
  '◊ ◧ ◊',
  'ⱋ ◇ ⱋ'], list);

// Upgrades
list['‗'] = <enderio:block_painted_pressure_plate:8>;
list['◩'] = <ore:plateSilicon>;
list['▭'] = <ore:ingotHSLASteel>;

for input, output in {
  <ic2:upgrade>                          : <artisanautomation:upgrade_speed>,
  <ic2:te:131>                           : <artisanautomation:upgrade_fluid_capacity>,
  <ic2:te:72>                            : <artisanautomation:upgrade_energy_capacity>,
  <ic2:upgrade:4>                        : <artisanautomation:upgrade_auto_export_items>,
  <ic2:upgrade:6>                        : <artisanautomation:upgrade_auto_import_items>,
  <ic2:te:91>                            : <artisanautomation:upgrade_auto_import_export_items>,
  <ic2:upgrade:9>                        : <artisanautomation:upgrade_auto_import_fluids>,
  <actuallyadditions:block_item_repairer>: <artisanautomation:upgrade_tool_repair>,
} as IItemStack[IIngredient] {
  list['▩'] = input;
  craft.make(output, ['pretty',
    '◩ ‗ ◩',
    '▭ ▩ ▭',
    '◩ ‗ ◩'], list);
}
