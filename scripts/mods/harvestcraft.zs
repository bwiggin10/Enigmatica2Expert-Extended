#modloaded harvestcraft

import crafttweaker.item.IItemStack;

// Make Universal Tweaks highlite items that have usages in crafting table recipes
/* Inject_js{
const recipesIngredients = getTableRecipes()
  ?.map(r => [...new Set([
    ...r.input.matchAll(/<([^:]+:[^:]+(?::\d+)?)>/g),
  ].map(o => o[1]))])
if(!recipesIngredients) return

const itemsMap = {}

recipesIngredients.forEach((ingrs) => {
  ingrs.forEach((item) => {
    const push = (it) => {
      if (!it.startsWith('harvestcraft:')) return
      itemsMap[it] ??= 0
      itemsMap[it]++
    }
    if (item.startsWith('ore:')) {
      const dictItems = getByOredict(item.substring(4))
      // if (item === 'ore:listAllmeatraw') debugger
      dictItems.forEach(tm =>
        push(tm.commandString.substring(1, tm.commandString.length - 1))
      )
    }
    else { push(item) }
  })
})

const result = Object.entries(itemsMap)
  .sort(([,a], [,b]) => b - a)
  .map(([item, recipesCount]) => {
    return `${item};${
      recipesCount === 1 ? 'uncommon' : recipesCount < 20 ? 'rare' : 'epic'
    }`
  })

const cfgPath = 'config/Universal Tweaks - Tweaks.cfg'

const union = [...new Set(config(cfgPath)
  .general.items['Custom Rarity']
  .concat(result))]

injectInFile(cfgPath, 'S:"Custom Rarity" <', '         >',
  `\n${union.map(s => `            ${s}`).join('\n')}\n`
)

return `// Managed ${result.length} Harvestcraft items`
} */
// Managed 638 Harvestcraft items
/**/

// Pam's Lemonade
recipes.remove(<harvestcraft:lemonaideitem>);
recipes.addShapeless(<harvestcraft:lemonaideitem>, [<ore:toolJuicer>, <ore:cropLemon>, <ore:listAllsugar>, <ore:listAllsugar>]);

// Pam's Cotton
recipes.remove(<harvestcraft:cottonitem>);

// Soft Pretzel
recipes.remove(<harvestcraft:softpretzelitem>);
recipes.addShapeless('Soft Pretzel',
  <harvestcraft:softpretzelitem>,
  [<ore:toolBakeware>, <ore:foodDough>, <ore:foodButter>,
    <ore:itemSalt>, <ore:itemSalt>]);

// Pam's Lavender Shortbread
recipes.remove(<harvestcraft:lavendershortbreaditem>);
recipes.addShapeless("Pam's Harvestcraft Lavender Shortbread",
  <harvestcraft:lavendershortbreaditem>,
  [<ore:toolBakeware>, <ore:foodDough>, <ore:flowerLavender>]);

oreDict.cropLychee.add(<harvestcraft:lycheeitem>);
oreDict.cropJackfruit.add(<harvestcraft:jackfruititem>);

recipes.addShapeless(<harvestcraft:cracklinsitem>, [<ore:toolPot>, <ore:listAllporkraw>, <ore:foodOliveoil>, <ore:cropSpiceleaf>]);
recipes.addShapeless(<harvestcraft:porkrindsitem>, [<ore:toolPot>, <ore:itemSalt>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);

recipes.addShapeless(<harvestcraft:imitationcrabsticksitem>, [<ore:toolCuttingboard>, <ore:foodFlour>, <ore:listAllfishcooked>, <ore:listAllegg>, <minecraft:dye:1>]);
recipes.addShapeless(<harvestcraft:saucedlambkebabitem>, [<ore:toolMixingbowl>, <ore:foodLambkebab>, <ore:foodPlainyogurt>, <ore:listAllheavycream>, <ore:cropGarlic>, <ore:cropSpiceleaf>, <ore:cropLime>]);
recipes.addShapeless(<harvestcraft:swedishmeatballsitem>, [<ore:toolSaucepan>, <ore:foodGroundbeef>, <ore:foodFlour>, <ore:cropSpiceleaf>, <ore:foodGroundnutmeg>, <ore:listAllheavycream>, <ore:foodBlackpepper>, <ore:listAllheavycream>, <ore:listAllegg>]);
recipes.addShapeless(<harvestcraft:garlicsteakitem>, [<ore:toolSkillet>, <ore:listAllbeefraw>, <ore:cropGarlic>, <ore:foodButter>, <ore:cropSpiceleaf>]);

recipes.removeShapeless(<harvestcraft:quesadillaitem>);
recipes.addShapeless(<harvestcraft:quesadillaitem>, [<ore:toolSkillet>, <ore:foodTortilla>, <ore:foodCheese>]);
recipes.addShapeless(<harvestcraft:schnitzelitem>, [<ore:toolSkillet>, <ore:listAllmuttonraw>, <ore:foodFlour>, <ore:cropLemon>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);
recipes.addShapeless(<harvestcraft:schnitzelitem>, [<ore:toolSkillet>, <ore:listAllporkraw>, <ore:foodFlour>, <ore:cropLemon>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);
recipes.addShapeless(<harvestcraft:bratwurstitem>, [<ore:toolCuttingboard>, <ore:foodPorksausage>, <ore:foodPickles>, <ore:cropOnion>, <minecraft:bread>]);

// Raw Meat -> Ground Meat
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundduckitem>, <harvestcraft:duckrawitem>, 2000);
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundmuttonitem>, <minecraft:mutton>, 2000);
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundturkeyitem>, <harvestcraft:turkeyrawitem>, 2000);
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundvenisonitem>, <harvestcraft:venisonrawitem>, 2000);

// Seeds/Crops that already have recipe added by IE and oredicted, will be removed and re-added from oredict
for item in [<minecraft:potato>] as IItemStack[] {
  mods.immersiveengineering.Fermenter.removeByInput(item);
}

for item in [
  <minecraft:wheat_seeds>,
  <minecraft:pumpkin_seeds>,
  <minecraft:beetroot_seeds>,
  <minecraft:melon_seeds>,
] as IItemStack[] {
  mods.immersiveengineering.Squeezer.removeByInput(item);
}

mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 80, <ore:listAllveggie>, 500);
mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 120, <ore:listAllfruit>, 500);
mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 100, <ore:listAllberry>, 500);
mods.immersiveengineering.Squeezer.addRecipe(null, <liquid:plantoil> * 80, <ore:listAllseed>, 500);

for i, dye in scripts.vars.oreDye {
  if (i == 0) continue;
  craft.reshapeless(itemUtils.getItem('harvestcraft:candledeco' ~ (i + 1)) * 4, 'AAAAc', {
    A: <harvestcraft:candledeco1>,
    c: dye,
  });
}

// Recipe Conflicts
recipes.removeByRecipeName('harvestcraft:honeyitem_foodhoneydrop');
recipes.removeByRecipeName('harvestcraft:honeyitem_drophoney');

// [Fresh Water]*8 from [Water Clay Bucket]
craft.shapeless(<harvestcraft:freshwateritem> * 8, '~', {
  '~': <claybucket:claybucket:1>.transformReplace(<claybucket:claybucket>), // Water Clay Bucket
});

// [Shipping Bin] from [Magical Apple][+2]
craft.remake(<harvestcraft:shippingbin>, ['pretty',
  'C # C',
  '# M #',
  'C # C'], {
  'C': <tconstruct:soil:4>,      // Consecrated Soil
  '#': <forestry:wood_pile>,     // Wood Pile
  'M': <extrautils2:magicapple>, // Magical Apple
});

// [Grinder] from [Stone Gear][+2]
craft.remake(<harvestcraft:grinder>, ['pretty',
  'D ¤ D',
  'D ¤ D',
  'R R R'], {
  'D': <tconstruct:materials:2>,        // Dried Brick
  '¤': <ore:gearStone>,                 // Stone Gear
  'R': <sonarcore:reinforceddirtbrick>, // Reinforced Dirt Brick
});

// [Presser] from [Compressed Cobblestone][+2]
craft.remake(<harvestcraft:presser>, ['pretty',
  'D ░ D',
  'D   D',
  'R ░ R'], {
  'D': <tconstruct:materials:2>,        // Dried Brick
  '░': <ore:compressed1xCobblestone>,   // Compressed Cobblestone
  'R': <sonarcore:reinforceddirtbrick>, // Reinforced Dirt Brick
});

// [Water Filter] from [Reinforced Dirt Brick][+1]
craft.remake(<harvestcraft:waterfilter>, ['pretty',
  '  S  ',
  'S R S',
  '  S  '], {
  'S': <exnihilocreatio:item_mesh:1>,   // String Mesh
  'R': <sonarcore:reinforceddirtbrick>, // Reinforced Dirt Brick
});

// [Cheese]*2 from [Milk][+3]
craft.reshapeless(<harvestcraft:cheeseitem> * 2, 'PACSS', {
  'P': <ore:toolPot>,     // Pot
  'A': <ore:listAllmilk>, // Milk
  'C': <ore:foodCheese>,  // Cheese
  'S': <ore:itemSalt>,    // Salt
});

// [Ground Trap] from [Oak Chest][+3]
craft.remake(<harvestcraft:groundtrap>, ['pretty',
  '# ≢ #',
  's c s',
  '# s #'], {
  '#': <ore:stickWood>,    // Stick
  '≢': <ore:trapdoorWood>, // Oak Trapdoor
  's': <ore:string>,       // String
  'c': <ore:chest>, // Oak Chest
});

// [Royal Jelly] from [Queen Bee]
recipes.remove(<harvestcraft:royaljellyitem>);
mods.integrateddynamics.Squeezer.addRecipe(<harvestcraft:queenbeeitem>, <harvestcraft:royaljellyitem>, 1.0f, <harvestcraft:royaljellyitem>, 1.0f, null, 0, null);
scripts.process.squeeze([<harvestcraft:queenbeeitem>], null, 'only: TECentrifuge', <harvestcraft:royaljellyitem> * 4);

// Simple seed rework
for item in [
  // <harvestcraft:chilipepperseeditem>,
  // <harvestcraft:coffeeseeditem>,
  // <harvestcraft:grapeseeditem>,
  // <harvestcraft:tomatoseeditem>,
  // <harvestcraft:riceitem>,
  <harvestcraft:olive_sapling>,
] as IItemStack[] {
  for i in 0 .. 3 {
    mods.thermalexpansion.Insolator.removeRecipe(item, <thermalfoundation:fertilizer>.definition.makeStack(i));
  }
}

// Remove all recipes that have duplicates with other salt oredict
// Keep only `itemSalt`
for id in [
  'harvestcraft:bakedturnipsitem',
  'harvestcraft:banananutbreaditem',
  'harvestcraft:beefjerkyitem',
  'harvestcraft:bolognaitem_x3',
  'harvestcraft:butteritem',
  'harvestcraft:chorizoitem',
  'harvestcraft:cornchipsitem',
  'harvestcraft:curryitem',
  'harvestcraft:damperitem',
  'harvestcraft:doughitem',
  'harvestcraft:friesitem',
  'harvestcraft:gherkinitem',
  'harvestcraft:gourmetbeefpattyitem',
  'harvestcraft:gourmetmuttonpattyitem',
  'harvestcraft:gourmetporkpattyitem',
  'harvestcraft:gourmetvenisonpattyitem',
  'harvestcraft:gravlaxitem',
  'harvestcraft:hotsauceitem_x6',
  'harvestcraft:icecreamitem',
  'harvestcraft:kimchiitem',
  'harvestcraft:mashedpotatoesitem',
  'harvestcraft:misopasteitem_x4',
  'harvestcraft:okrachipsitem',
  'harvestcraft:oystersauceitem',
  'harvestcraft:pepperoniitem',
  'harvestcraft:pickledbeetsitem',
  'harvestcraft:pickledonionsitem',
  'harvestcraft:picklesitem',
  'harvestcraft:pitepaltitem',
  'harvestcraft:porkrindsitem',
  'harvestcraft:porksausageitem',
  'harvestcraft:potatosoupitem',
  'harvestcraft:rawtofaconitem',
  'harvestcraft:roastchickenitem',
  'harvestcraft:roastpotatoesitem',
  'harvestcraft:saladdressingitem',
  'harvestcraft:saltedcaramelitem',
  'harvestcraft:saltedsunflowerseedsitem',
  'harvestcraft:sausageitem',
  'harvestcraft:soysauceitem',
  'harvestcraft:spicymustardporkitem',
  'harvestcraft:steamedpeasitem',
  'harvestcraft:sunflowerwheatrollsitem',
  'harvestcraft:taffyitem',
  'harvestcraft:veggiestripsitem',
  'harvestcraft:yorkshirepuddingitem',
] as string[] {
  recipes.removeByRecipeName(id ~ '_dustsalt');
  recipes.removeByRecipeName(id ~ '_foodsalt');
}

recipes.removeByRecipeName('harvestcraft:zombiejerkyitem_dustsalt_dustsalt');
recipes.removeByRecipeName('harvestcraft:zombiejerkyitem_foodsalt_dustsalt');
recipes.removeByRecipeName('harvestcraft:zombiejerkyitem_foodsalt_foodsalt');
recipes.removeByRecipeName('harvestcraft:zombiejerkyitem_itemsalt_dustsalt');
recipes.removeByRecipeName('harvestcraft:zombiejerkyitem_itemsalt_foodsalt');

// Remove all crop => seed recipes since seeds doesnt have actual usage except planting,
// and planting available directly, without turning into seed
for id in [
  'harvestcraft:zucchiniseeditem',
  'harvestcraft:wintersquashseeditem',
  'harvestcraft:whitemushroomseeditem',
  'harvestcraft:waterchestnutseeditem',
  'harvestcraft:turnipseeditem',
  'harvestcraft:tomatoseeditem',
  'harvestcraft:tomatilloseeditem',
  'harvestcraft:teaseeditem',
  'harvestcraft:taroseeditem',
  'harvestcraft:sweetpotatoseeditem',
  'harvestcraft:strawberryseeditem',
  'harvestcraft:spinachseeditem',
  'harvestcraft:spiceleafseeditem',
  'harvestcraft:soybeanseeditem',
  'harvestcraft:sisalseeditem',
  'harvestcraft:sesameseedsseeditem',
  'harvestcraft:seaweedseeditem',
  'harvestcraft:scallionseeditem',
  'harvestcraft:ryeseeditem',
  'harvestcraft:rutabagaseeditem',
  'harvestcraft:riceseeditem',
  'harvestcraft:rhubarbseeditem',
  'harvestcraft:raspberryseeditem',
  'harvestcraft:radishseeditem',
  'harvestcraft:quinoaseeditem',
  'harvestcraft:pineappleseeditem',
  'harvestcraft:peasseeditem',
  'harvestcraft:peanutseeditem',
  'harvestcraft:parsnipseeditem',
  'harvestcraft:onionseeditem',
  'harvestcraft:okraseeditem',
  'harvestcraft:oatsseeditem',
  'harvestcraft:mustardseeditem',
  'harvestcraft:mulberryseeditem',
  'harvestcraft:milletseeditem',
  'harvestcraft:lettuceseeditem',
  'harvestcraft:lentilseeditem',
  'harvestcraft:leekseeditem',
  'harvestcraft:kohlrabiseeditem',
  'harvestcraft:kiwiseeditem',
  'harvestcraft:kenafseeditem',
  'harvestcraft:kaleseeditem',
  'harvestcraft:juteseeditem',
  'harvestcraft:juniperberryseeditem',
  'harvestcraft:jicamaseeditem',
  'harvestcraft:huckleberryseeditem',
  'harvestcraft:greengrapeseeditem',
  'harvestcraft:grapeseeditem',
  'harvestcraft:gingerseeditem',
  'harvestcraft:garlicseeditem',
  'harvestcraft:flaxseeditem',
  'harvestcraft:elderberryseeditem',
  'harvestcraft:eggplantseeditem',
  'harvestcraft:curryleafseeditem',
  'harvestcraft:cucumberseeditem',
  'harvestcraft:cranberryseeditem',
  'harvestcraft:cottonseeditem',
  'harvestcraft:cornseeditem',
  'harvestcraft:coffeeseeditem',
  'harvestcraft:chilipepperseeditem',
  'harvestcraft:chickpeaseeditem',
  'harvestcraft:celeryseeditem',
  'harvestcraft:cauliflowerseeditem',
  'harvestcraft:cassavaseeditem',
  'harvestcraft:cantaloupeseeditem',
  'harvestcraft:candleberryseeditem',
  'harvestcraft:cactusfruitseeditem',
  'harvestcraft:cabbageseeditem',
  'harvestcraft:brusselsproutseeditem',
  'harvestcraft:broccoliseeditem',
  'harvestcraft:blueberryseeditem',
  'harvestcraft:blackberryseeditem',
  'harvestcraft:bellpepperseeditem',
  'harvestcraft:beetseeditem',
  'harvestcraft:beanseeditem',
  'harvestcraft:barleyseeditem',
  'harvestcraft:bambooshootseeditem',
  'harvestcraft:asparagusseeditem',
  'harvestcraft:artichokeseeditem',
  'harvestcraft:arrowrootseeditem',
  'harvestcraft:amaranthseeditem',
  'harvestcraft:agaveseeditem',
] as string[] {
  recipes.removeByRecipeName(id);
}
