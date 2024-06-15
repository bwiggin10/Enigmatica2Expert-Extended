#modloaded scalinghealth

import crafttweaker.item.IIngredient;

Purge(<scalinghealth:difficultychanger>);
Purge(<scalinghealth:difficultychanger:1>);

// Heart dust
val HD = <scalinghealth:heartdust>;
val HS = <scalinghealth:crystalshard>;
// [Heart Dust] from [Pestle and Mortar][+1]
craft.reshapeless(HD, 'A***', {
  'A': <ore:pestleAndMortar>,        // Pestle and Mortar
  '*': HS, // Heart Crystal Shard
});
mods.rats.recipes.addGemcutterRatRecipe(HS, HD);
scripts.process.crush(HS * 2, HD, 'only: eu2Crusher AACrusher', [HD], [0.2f]);
scripts.process.crush(HS    , HD, 'only: SagMill Pulverizer', [HD, HD, HD], [0.8f, 0.4f, 0.2f]);

// ---------------------------
val h = <scalinghealth:heartdust>;
for mobId, ingr in {
  'emberroot:enderminy'       : <ore:enderpearl>,                         //  Ender Pearl
  'emberroot:knight_fallen'   : <tconstruct:sword_blade>.withTag({ Material: 'iron' }),       // Iron Sword Blade
  'emberroot:hero'            : <minecraft:armor_stand>,                  //  Armor Stand
  'emberroot:rainbow_golem'   : <ore:blockSheetmetalIron>,                //  Iron Sheetmetal
  'emberroot:withercat'       : <ore:dustWither>,                         //  Wither Dust
  'quark:crab'                : <ore:foodCrabraw>,                        //  Raw Crab
  'quark:pirate'              : <rustic:fluid_bottle>.withTag({ Fluid: { FluidName: 'wine', Amount: 1000, Tag: { Quality: 1 as float } } }),
  'rats:illager_piper'        : <ore:foodCheese>,
  'iceandfire:stymphalianbird': <ore:ingotBronze>,
  'iceandfire:dread_lich'     : <twilightforest:ice_bomb>,
} as IIngredient[string] {
  mods.rustic.Condenser.addRecipe(
    <thermalexpansion:morb>.withTag({ id: mobId, Generic: 1 as byte }),
    [h,h,h], ingr, <thermalexpansion:morb>, <fluid:water> * 50, 40);
}

// Peaceful alt
mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(<scalinghealth:crystalore>, <minecraft:redstone_ore>, 1);
