#modloaded animus

// Remove health shard recipe (actually no output)
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:prismarine_shard>);

// Leech Reagent
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:sapling>, <minecraft:leaves>, <minecraft:tallgrass:1>, <minecraft:cooked_porkchop>]);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodPloughmanslunch>, <ore:dropofevil>, <darkutils:charm_gluttony>, <ore:runeGluttonyB>], 500, 100);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodChimichanga>, <ore:dropofevil>, <darkutils:charm_gluttony>, <ore:runeGluttonyB>], 500, 100);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodDelightedmeal>, <ore:dropofevil>, <darkutils:charm_gluttony>, <ore:runeGluttonyB>], 500, 100);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<harvestcraft:randomtacoitem>, <ore:dropofevil>, <darkutils:charm_gluttony>, <ore:runeGluttonyB>], 500, 100);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodDeluxechickencurry>, <ore:dropofevil>, <darkutils:charm_gluttony>, <ore:runeGluttonyB>], 500, 100);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:3>, [<ore:foodChickencurry>, <ore:dropofevil>, <darkutils:charm_gluttony>, <ore:runeGluttonyB>], 500, 100);

// Consumption Reagent
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:iron_pickaxe>, <minecraft:iron_pickaxe>, <minecraft:iron_pickaxe>, <minecraft:iron_pickaxe>]);
mods.bloodmagic.TartaricForge.addRecipe(<animus:component:2>, [<bloodmagic:bound_pickaxe>.anyDamage(), <bloodmagic:bound_shovel>.anyDamage(), <immersiveengineering:drillhead:1>, <ore:runeWrathB>], 300, 50);

// Khopesh
remake('animus_kama_diamond', <animus:kama_diamond>, [
  [null, <ore:gemDiamondRat>, null],
  [<ore:gemDiamondRat>, null, <ore:blockDiamond>],
  [null, null, <forestry:oak_stick>],
]);

// Fix bucket of dirt
recipes.removeByRecipeName('animus:dirtbucket');
recipes.addShapeless('animus_dirtbucket', Bucket('blockfluiddirt'), [
  <minecraft:redstone_torch>, utils.reuse(<animus:sigil_consumption>), <minecraft:bucket>]);
