#modloaded bibliocraft
import crafttweaker.item.IItemStack;

for item in [
  <bibliocraft:framedchest:1>,
  <bibliocraft:framedchest:2>,
  <bibliocraft:framedchest:3>,
  <bibliocraft:framedchest:4>,
  <bibliocraft:framedchest:5>,
  <bibliocraft:framedchest:6>,
] as IItemStack[] {
  Purge(item).fuel();
}

// Creative Bookcase
recipes.addShaped('Creative Bookcase Main',
  <bibliocraft:bookcasecreative>,
  [[<bibliocraft:bigbook>, <bibliocraft:bookcase:*>, <bibliocraft:bigbook>],
    [<bibliocraft:bigbook>, <bibliocraft:printingpress:*>, <bibliocraft:bigbook>],
    [<bibliocraft:bigbook>, <bibliocraft:bibliodrill>, <bibliocraft:bigbook>]]);

// Switching between plank type
recipes.addShapeless('Creative Bookcase0', <bibliocraft:bookcasecreative>, [<bibliocraft:bookcasecreative:6>]);
recipes.addShapeless('Creative Bookcase6', <bibliocraft:bookcasecreative:6>, [<bibliocraft:bookcasecreative:5>]);
recipes.addShapeless('Creative Bookcase5', <bibliocraft:bookcasecreative:5>, [<bibliocraft:bookcasecreative:4>]);
recipes.addShapeless('Creative Bookcase4', <bibliocraft:bookcasecreative:4>, [<bibliocraft:bookcasecreative:3>]);
recipes.addShapeless('Creative Bookcase3', <bibliocraft:bookcasecreative:3>, [<bibliocraft:bookcasecreative:2>]);
recipes.addShapeless('Creative Bookcase2', <bibliocraft:bookcasecreative:2>, [<bibliocraft:bookcasecreative:1>]);
recipes.addShapeless('Creative Bookcase1', <bibliocraft:bookcasecreative:1>, [<bibliocraft:bookcasecreative>]);

// 4x Harder framing sheet
craft.reshapeless(<bibliocraft:framingsheet> * 2, 'AB', {
  A: <bibliocraft:framingsaw>,
  B: <ore:logWood> });

// Saw acces earlier
craft.remake(<bibliocraft:framingsaw>, ['pretty',
  'A A  ',
  '  A B',
  '    C'], {
  A: <ore:itemFlint>,
  B: <tconstruct:tough_tool_rod>.withTag({ Material: 'wood' }),
  C: <ore:leather> });

// [Print Press Chase] from [Iron Ingot][+1]
craft.remake(<bibliocraft:bibliochase>, ['pretty',
  '  #  ',
  '# ▬ #',
  '  #  '], {
  '#': <ore:slabWood>, // Oak Wood Slab
  '▬': <ore:ingotFakeIron>, // Iron Ingot
});
