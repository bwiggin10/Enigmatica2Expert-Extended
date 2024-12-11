import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#ignoreBracketErrors
#priority 2000
#reloadable

// Used for $orderly
#modloaded zenutils

// Logs to planks recipes
static logPlank as IItemStack[IItemStack] = {
// Vanilla
  <minecraft:log>    : <minecraft:planks>,
  <minecraft:log:1>  : <minecraft:planks:1>,
  <minecraft:log:2>  : <minecraft:planks:2>,
  <minecraft:log:3>  : <minecraft:planks:3>,
  <minecraft:log2>   : <minecraft:planks:4>,
  <minecraft:log2:1> : <minecraft:planks:5>,
} as IItemStack[IItemStack]$orderly;

// Modded
static logPlankModded as IItemStack[IItemStack] = {
// Twilight Forest
  <twilightforest:twilight_log>   : <twilightforest:twilight_oak_planks>,
  <twilightforest:twilight_log:1> : <twilightforest:canopy_planks>,
  <twilightforest:twilight_log:2> : <twilightforest:mangrove_planks>,
  <twilightforest:twilight_log:3> : <twilightforest:dark_planks>,
  <twilightforest:magic_log>      : <twilightforest:time_planks>,
  <twilightforest:magic_log:1>    : <twilightforest:trans_planks>,
  <twilightforest:magic_log:2>    : <twilightforest:mine_planks>,
  <twilightforest:magic_log:3>    : <twilightforest:sort_planks>,

// Biomes O' plenty, made by Trilexcom
  <biomesoplenty:log_0:4> : <biomesoplenty:planks_0>,
  <biomesoplenty:log_0:5> : <biomesoplenty:planks_0:1>,
  <biomesoplenty:log_0:6> : <biomesoplenty:planks_0:2>,
  <biomesoplenty:log_0:7> : <biomesoplenty:planks_0:3>,
  <biomesoplenty:log_1:5> : <biomesoplenty:planks_0:5>,
  <biomesoplenty:log_1:6> : <biomesoplenty:planks_0:6>,
  <biomesoplenty:log_2:4> : <biomesoplenty:planks_0:8>,
  <biomesoplenty:log_2:5> : <biomesoplenty:planks_0:9>,
  <biomesoplenty:log_2:6> : <biomesoplenty:planks_0:10>,
  <biomesoplenty:log_2:7> : <biomesoplenty:planks_0:11>,
  <biomesoplenty:log_3:4> : <biomesoplenty:planks_0:12>,
  <biomesoplenty:log_3:5> : <biomesoplenty:planks_0:13>,
  <biomesoplenty:log_3:6> : <biomesoplenty:planks_0:14>,
  <biomesoplenty:log_3:7> : <biomesoplenty:planks_0:15>,
  <biomesoplenty:log_1:7> : <biomesoplenty:planks_0:7>,

// pam
  <harvestcraft:pamcinnamon>  : <minecraft:planks:3>,
  <harvestcraft:pammaple>     : <minecraft:planks:1>,
  <harvestcraft:pampaperbark> : <minecraft:planks:3>,

// Other Mods
  <rustic:log>                   : <rustic:planks>,
  <rustic:log:1>                 : <rustic:planks:1>,
  <thaumcraft:log_greatwood>     : <thaumcraft:plank_greatwood>,
  <thaumcraft:log_silverwood>    : <thaumcraft:plank_silverwood>,
  <integrateddynamics:menril_log>: <integrateddynamics:menril_planks>,
  <advancedrocketry:alienwood>   : <advancedrocketry:planks>,
  <extrautils2:ironwood_log>     : <extrautils2:ironwood_planks>,
  <extrautils2:ironwood_log:1>   : <extrautils2:ironwood_planks:1>,
  <iceandfire:dreadwood_log>     : <iceandfire:dreadwood_planks>,
  <randomthings:spectrelog>      : <randomthings:spectreplank>,

// Magical wood special
  <extrautils2:decorativesolidwood:1>: <extrautils2:decorativesolidwood>,
  <thaumcraft:taint_log>             : <thaumadditions:taintwood_planks>,
  <botania:livingwood>               : <botania:livingwood:1>,
  <botania:dreamwood>                : <botania:dreamwood:1>,
  <astralsorcery:blockinfusedwood>   : <astralsorcery:blockinfusedwood:1>,
} as IItemStack[IItemStack]$orderly;

// Forestry flamable
static logPlankForestry as IItemStack[IItemStack] = {
  <forestry:logs.0>   : <forestry:planks.0>,
  <forestry:logs.0:1> : <forestry:planks.0:1>,
  <forestry:logs.0:2> : <forestry:planks.0:2>,
  <forestry:logs.0:3> : <forestry:planks.0:3>,
  <forestry:logs.1>   : <forestry:planks.0:4>,
  <forestry:logs.1:1> : <forestry:planks.0:5>,
  <forestry:logs.1:2> : <forestry:planks.0:6>,
  <forestry:logs.1:3> : <forestry:planks.0:7>,
  <forestry:logs.2>   : <forestry:planks.0:8>,
  <forestry:logs.4:2> : <forestry:planks.1:2>,
  <forestry:logs.4:3> : <forestry:planks.1:3>,
  <forestry:logs.5>   : <forestry:planks.1:4>,
  <forestry:logs.5:2> : <forestry:planks.1:6>,
  <forestry:logs.5:1> : <forestry:planks.1:5>,
  <forestry:logs.3:3> : <forestry:planks.0:15>,
  <forestry:logs.2:3> : <forestry:planks.0:11>,
  <forestry:logs.3>   : <forestry:planks.0:12>,
  <forestry:logs.3:1> : <forestry:planks.0:13>,
  <forestry:logs.3:2> : <forestry:planks.0:14>,
  <forestry:logs.5:3> : <forestry:planks.1:7>,
  <forestry:logs.6:2> : <forestry:planks.1:10>,
  <forestry:logs.6:1> : <forestry:planks.1:9>,
  <forestry:logs.6>   : <forestry:planks.1:8>,
  <forestry:logs.4>   : <forestry:planks.1>,
  <forestry:logs.4:1> : <forestry:planks.1:1>,
  <forestry:logs.2:1> : <forestry:planks.0:9>,
  <forestry:logs.7>   : <forestry:planks.1:12>,
  <forestry:logs.2:2> : <forestry:planks.0:10>,
  <forestry:logs.6:3> : <forestry:planks.1:11>,
} as IItemStack[IItemStack]$orderly;

// Forestry fireproof
static logPlankFireproof as IItemStack[IItemStack] = {
  <forestry:logs.fireproof.0:1>        : <forestry:planks.fireproof.0:1>,
  <forestry:logs.fireproof.0:2>        : <forestry:planks.fireproof.0:2>,
  <forestry:logs.fireproof.0:3>        : <forestry:planks.fireproof.0:3>,
  <forestry:logs.fireproof.0>          : <forestry:planks.fireproof.0>,
  <forestry:logs.fireproof.1:1>        : <forestry:planks.fireproof.0:5>,
  <forestry:logs.fireproof.1:2>        : <forestry:planks.fireproof.0:6>,
  <forestry:logs.fireproof.1:3>        : <forestry:planks.fireproof.0:7>,
  <forestry:logs.fireproof.1>          : <forestry:planks.fireproof.0:4>,
  <forestry:logs.fireproof.2:1>        : <forestry:planks.fireproof.0:9>,
  <forestry:logs.fireproof.2:2>        : <forestry:planks.fireproof.0:10>,
  <forestry:logs.fireproof.2:3>        : <forestry:planks.fireproof.0:11>,
  <forestry:logs.fireproof.2>          : <forestry:planks.fireproof.0:8>,
  <forestry:logs.fireproof.3:1>        : <forestry:planks.fireproof.0:13>,
  <forestry:logs.fireproof.3:2>        : <forestry:planks.fireproof.0:14>,
  <forestry:logs.fireproof.3:3>        : <forestry:planks.fireproof.0:15>,
  <forestry:logs.fireproof.3>          : <forestry:planks.fireproof.0:12>,
  <forestry:logs.fireproof.4:1>        : <forestry:planks.fireproof.1:1>,
  <forestry:logs.fireproof.4:2>        : <forestry:planks.fireproof.1:2>,
  <forestry:logs.fireproof.4:3>        : <forestry:planks.fireproof.1:3>,
  <forestry:logs.fireproof.4>          : <forestry:planks.fireproof.1>,
  <forestry:logs.fireproof.5:1>        : <forestry:planks.fireproof.1:5>,
  <forestry:logs.fireproof.5:2>        : <forestry:planks.fireproof.1:6>,
  <forestry:logs.fireproof.5:3>        : <forestry:planks.fireproof.1:7>,
  <forestry:logs.fireproof.5>          : <forestry:planks.fireproof.1:4>,
  <forestry:logs.fireproof.6:1>        : <forestry:planks.fireproof.1:9>,
  <forestry:logs.fireproof.6:2>        : <forestry:planks.fireproof.1:10>,
  <forestry:logs.fireproof.6:3>        : <forestry:planks.fireproof.1:11>,
  <forestry:logs.fireproof.6>          : <forestry:planks.fireproof.1:8>,
  <forestry:logs.fireproof.7>          : <forestry:planks.fireproof.1:12>,
  <forestry:logs.vanilla.fireproof.0:1>: <forestry:planks.vanilla.fireproof.0:1>,
  <forestry:logs.vanilla.fireproof.0:2>: <forestry:planks.vanilla.fireproof.0:2>,
  <forestry:logs.vanilla.fireproof.0:3>: <forestry:planks.vanilla.fireproof.0:3>,
  <forestry:logs.vanilla.fireproof.0>  : <forestry:planks.vanilla.fireproof.0>,
  <forestry:logs.vanilla.fireproof.1:1>: <forestry:planks.vanilla.fireproof.0:5>,
  <forestry:logs.vanilla.fireproof.1>  : <forestry:planks.vanilla.fireproof.0:4>,
} as IItemStack[IItemStack]$orderly;

// Create nonfireproof oredict
function addToNonfireproof(list as IItemStack[IItemStack]) as void {
  for log, plank in list {
    if(isNull(log) || isNull(plank)) continue;
    <ore:logNonfireproof>.add(log);
    <ore:plankNonfireproof>.add(plank);
  }
}

addToNonfireproof(logPlank); // Vanilla only here
addToNonfireproof(logPlankForestry);

// Create fireproof oredict
for log, plank in logPlankFireproof {
  if(isNull(log) || isNull(plank)) continue;
  <ore:logFireproof>.add(log);
  <ore:plankFireproof>.add(plank);
}

// Merge lists to main one
function merge(list as IItemStack[IItemStack]) as void {
  for log, plank in list {
    if(isNull(log) || isNull(plank)) continue;
    logPlank[log] = plank;
  }
}

merge(logPlankModded);
merge(logPlankForestry);
merge(logPlankFireproof);
