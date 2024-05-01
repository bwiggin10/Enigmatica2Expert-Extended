#modloaded mekanism

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// JEI search string to see all planks
// plankWood -@chisel -"(fireproof)" -"Vertical" -" Painted "

// Helper Function
function saw(input as IIngredient, output as IItemStack, exceptions as string) as void {
  if(isNull(input) || isNull(output)) return;

  // BlockCutter should add all recipes.
  // All table recipes should be replaced
  scripts.process.sawWood(input, output, 'only: blockCutter strict: shapeless');

  // TE Sawmill generates x3 recipes automatically from craftingTable recipes so we add its in exceptions
  scripts.process.sawWood(input, output, 'except: TESawmill blockCutter shapeless ' ~ exceptions);
}

for log, plank in scripts.lib.wood.logPlank {
  val id = log.definition.id;
  val mod = id.split(':')[0];
  val exceptions
    = mod == 'forestry'
    || mod == 'iceandfire'
    || mod == 'botania'
    || mod == 'astralsorcery'
    || id == 'extrautils2:decorativesolidwood'
    || id == 'thaumcraft:taint_log'
      ? 'no exceptions'
      : 'only: mekSawmill AdvRockCutter';
  saw(log, plank, exceptions);
}

// Remove since its not removed automatically by saw() func
recipes.removeByRecipeName('astralsorcery:shapeless/infused_wood_planks');

// Magical wood special
scripts.process.sawWood(<extrautils2:decorativesolidwood:1>, <extrautils2:decorativesolidwood>, 'only: TESawmill');

// Sawdust compat
mods.mekanism.sawmill.removeRecipe(<ore:plankWood>);
mods.mekanism.sawmill.removeRecipe(<ore:slabWood>);
mods.mekanism.sawmill.addRecipe(<ore:stickWood>, <thermalfoundation:material:800>);
mods.mekanism.sawmill.addRecipe(<ore:plankWood>, <minecraft:stick> * 6, <thermalfoundation:material:800>, 0.25);
mods.mekanism.sawmill.addRecipe(<ore:slabWood>, <minecraft:stick> * 3, <thermalfoundation:material:800>, 0.25 / 2.0);

// Sticks
recipes.remove(<minecraft:stick>);
recipes.addShapedMirrored('Sticks',
  <minecraft:stick> * 2,
  [[<ore:plankWood>],
    [<ore:plankWood>]]);

recipes.addShapedMirrored('Sticks from logs',
  <minecraft:stick> * 4,
  [[<ore:logWood>],
    [<ore:logWood>]]);

// [Stick]*36 from [Single Compressed Wood]
craft.shapeless(<minecraft:stick> * 36, '##', {
  '#': <ore:compressedLogWood1x>, // Single Compressed Wood
});

// [Scaffolding]*36 from [Double Compressed Wood]
craft.shapeless(<openblocks:scaffolding> * 36, '##', {
  '#': <ore:compressedLogWood2x>, // Double Compressed Wood
});

// [Framed Trim]*36 from [Triple Compressed Wood]
craft.shapeless(<storagedrawers:customtrim> * 36, '##', {
  '#': <ore:compressedLogWood3x>, // Triple Compressed Wood
});

// Treated Wood sticks
recipes.remove(<immersiveengineering:material>);
scripts.process.sawWood(<ore:plankTreatedWood>, <immersiveengineering:material>, 'except: Shapeless BlockCutter');
recipes.addShapedMirrored('Teated sticks',
  <immersiveengineering:material> * 2,
  [[<ore:plankTreatedWood>],
    [<ore:plankTreatedWood>]]);

/*

getUnchangedTableRecipes()
.filter(r => Number(r.out_amount) === 4 && !r.input.includes(','))
.map((r) => {
  val item = r.input.replace(/^\[+<|>\]+$/g, '')
  const [source, entry, meta] = item.split(':')
  val id = `${source}:${entry}`
  val input = itemize(id, meta)
  val output = itemize(r.out_id, r.out_meta)
  return {
    input,
    in_ore : [...getItemOredictSet(id, meta)],
    output,
    out_ore: [...getItemOredictSet(r.out_id, r.out_meta)],
  }
})
.filter(o => o.in_ore.includes('logWood') && o.out_ore.some(or => or.startsWith('plank')))
.map(o => [`  <${o.input}>`, ':', `<${o.output}>,`])
.sort((a, b) => naturalSort(a[0], b[0]))

*/
