// Examples of Requious Fracto: https://github.com/DaedalusGame/The-Testbed

#modloaded requious
#priority 975
#reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val x = <assembly:crafting_hints>;
x.addJEICatalyst(<minecraft:item_frame>);
scripts.jei.requious.arrow(x, 4, 1);
scripts.jei.requious.addInsOuts(x, [
  [4, 0],
  [0, 0], [1, 0], [2, 0],
  [0, 1], [1, 1], [2, 1],
  [0, 2], [1, 2], [2, 2],
], [
  [6, 1], [7, 1], [8, 1],
]);
x.setJEIItemSlot(4, 0, 'input0', scripts.jei.requious.getVisSlots(0, 2));
x.setJEIFluidSlot(1, 3, 'fluid_in');
x.setJEIFluidSlot(7, 2, 'fluid_out');

function addInsOutsCatl(input as IIngredient[], outputs as IItemStack[], catalyst as IIngredient = null) as void {
  scripts.jei.requious.add(<assembly:crafting_hints>, {
    [catalyst,
      input.length > 7 ? input[7] : null,
      input.length > 3 ? input[3] : null,
      input.length > 5 ? input[5] : null,
      input.length > 2 ? input[2] : null,
      input.length > 0 ? input[0] : null,
      input.length > 1 ? input[1] : null,
      input.length > 8 ? input[8] : null,
      input.length > 4 ? input[4] : null,
      input.length > 6 ? input[6] : null,
    ]: [
      outputs.length > 2 ? outputs[2] : null,
      outputs.length > 0 ? outputs[0] : null,
      outputs.length > 1 ? outputs[1] : null,
    ],
  });
}

function addInsOutCatl(input as IIngredient[], output as IItemStack, catalyst as IIngredient = null) as void {
  return addInsOutsCatl(input, [output], catalyst);
}

function add1to1(input as IIngredient, output as IItemStack, catalyst as IIngredient = null) as void {
  addInsOutCatl([input], output, catalyst);
}

function fill(input as IIngredient, fluid as ILiquidStack, output as IItemStack, catalyst as IIngredient = null, duration as int = 0) as void {
  var rec = AssemblyRecipe.create(function (c) { c.addItemOutput('output1', output); });
  if(!isNull(fluid)) rec.requireFluid('fluid_in', fluid);
  if(!isNull(input)) rec.requireItem('input5', input);
  if (!isNull(catalyst)) rec = rec.requireItem('input0', catalyst);
  <assembly:crafting_hints>.addJEIRecipe(rec.requireDuration('duration', duration));
}

function special(output as IItemStack, input2d as IIngredient[][], condition as string) as void {
  val assRec = AssemblyRecipe.create(function (c) {
    c.addItemOutput('output1', output);
    c.addItemOutput('output2',
      utils.tryCatch('engineersdecor:sign_caution', <minecraft:structure_void>)
        .withDisplayName('§e§lCondition').withLore(['§e' ~ condition]));
  });
  for y, input1d in input2d {
    for x, ingr in input1d {
      if (isNull(ingr)) continue;
      assRec.requireItem('input' ~ (y * 3 + x + 1), ingr);
    }
  }
  assRec.requireItem('input0', <minecraft:crafting_table>);
  <assembly:crafting_hints>.addJEIRecipe(assRec);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------

add1to1(<thaumcraft:cluster:1>, <minecraft:gold_ingot> * 8, <entity:randomthings:goldenchicken>.asIngr());
add1to1(<entity:minecraft:zombie>.asIngr() | <entity:minecraft:villager>.asIngr(), <bloodmagic:blood_shard>, <bloodmagic:bound_sword>.withTag({ Unbreakable: 1 as byte, activated: 1 as byte }));

x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addFluidOutput('fluid_out', <liquid:canolaoil> * 80);
})
  .requireItem('input0', <actuallyadditions:block_canola_press>)
  .requireItem('input5', <actuallyadditions:item_misc:13>)
);
x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addFluidOutput('fluid_out', <liquid:refinedcanolaoil> * 80);
})
  .requireFluid('fluid_in', <liquid:canolaoil> * 80)
  .requireItem('input0', <actuallyadditions:block_fermenting_barrel>)
);
x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addFluidOutput('fluid_out', <liquid:blockfluidantimatter> * 1000);
})
  .requireFluid('fluid_in', <liquid:lifeessence> * 1000)
  .requireItem('input0', <cyclicmagic:ender_lightning>)
);

// Myclium convert
addInsOutCatl([<exnihilocreatio:item_material:3>, <minecraft:dirt:*>], <minecraft:mycelium>);

// CC Printer
addInsOutCatl([<minecraft:paper>, <minecraft:dye:*>], <computercraft:printout>, <computercraft:peripheral:3>);

// OC 3d printer
addInsOutCatl([<opencomputers:material:28>, <ore:dye>], <opencomputers:print>, <opencomputers:printer>);

// OC Assembler
addInsOutCatl([<opencomputers:case1> | <opencomputers:case2> | <opencomputers:case3>], <opencomputers:robot>, <opencomputers:assembler>);
addInsOutCatl([<opencomputers:material:17> | <opencomputers:material:18>], <opencomputers:misc>, <opencomputers:assembler>);
addInsOutCatl([<opencomputers:material:23> | <opencomputers:material:24>], <opencomputers:misc:1>, <opencomputers:assembler>);
addInsOutCatl([<opencomputers:material:20> | <opencomputers:material:21>], <opencomputers:microcontroller>, <opencomputers:assembler>);

// XP Bottler
val xp_bottler = itemUtils.getItem('openblocks:xp_bottler');
if (!isNull(xp_bottler)) {
  for fluid in ['essence', 'xpjuice', 'experience'] as string[] {
    fill(<minecraft:glass_bottle>, game.getLiquid(fluid) * 160, <minecraft:experience_bottle>, xp_bottler, 20);
  }
}

// Fireflys and Cicadas
scripts.jei.requious.add(<assembly:crafting_hints>, { [null, null, null, null, null, <twilightforest:twilight_sapling:1>]: [null, <twilightforest:firefly>] });
addInsOutsCatl([<twilightforest:twilight_sapling:4>], [<twilightforest:cicada> * 8, <minecraft:mob_spawner>, <lootr:lootr_chest>]);

// Taint to Flux Goo
x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addFluidOutput('fluid_out', <fluid:flux_goo> * 1000);
})
  .requireItem('input5', <thaumcraft:bottle_taint>)
);

//////////////////////////////////////////////////////////////////////
// IC2
//////////////////////////////////////////////////////////////////////
x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addItemOutput('output1', <ic2:resource>);
})
  .requireFluid('fluid_in', <fluid:ic2pahoehoe_lava> * 1000)
);

x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addFluidOutput('fluid_out', <fluid:ic2steam> * 1000);})
  .requireFluid('fluid_in', <fluid:water> * 10)
  .requireItem('input0', <ic2:te:34>));

x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addFluidOutput('fluid_out', <fluid:ic2superheated_steam> * 1000);})
  .requireFluid('fluid_in', <fluid:water> * 10)
  .requireItem('input0', <ic2:te:34>));

x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addItemOutput('output1', <ic2:foam> * 10);})
  .requireFluid('fluid_in', <fluid:ic2construction_foam> * 1000)
  .requireItem('input0', <ic2:foam_sprayer>));

x.addJEIRecipe(AssemblyRecipe.create(function (c) {
  c.addItemOutput('output1', <ic2:foam:1> * 10);})
  .requireFluid('fluid_in', <fluid:ic2construction_foam> * 1000)
  .requireItem('input5', <ic2:scaffold:2> * 10)
  .requireItem('input0', <ic2:foam_sprayer>));
//////////////////////////////////////////////////////////////////////

add1to1(null, <avaritia:resource:2>, <avaritia:neutron_collector>);

// Luck of the sea
add1to1(null, <minecraft:fish:*>,
  <exnihilocreatio:item_mesh:1>.withTag({ ench: [{ lvl: 0 as short, id: 41 }] })
  | <exnihilocreatio:item_mesh:2>.withTag({ ench: [{ lvl: 0 as short, id: 41 }] })
  | <exnihilocreatio:item_mesh:3>.withTag({ ench: [{ lvl: 0 as short, id: 41 }] })
  | <exnihilocreatio:item_mesh:4>.withTag({ ench: [{ lvl: 0 as short, id: 41 }] })
);

// Metamorphic stones
addInsOutCatl([<minecraft:stone:*>], <botania:biomestonea:*>, <botania:specialflower>.withTag({ type: 'marimorphosis' }));

// IC2 Booze
addInsOutCatl([<minecraft:reeds>], <ic2:booze_mug:2>, <ic2:barrel:*>);
addInsOutCatl([<ic2:fluid_cell>.withTag({ Fluid: { FluidName: 'water', Amount: 1000 } }), <ic2:crop_res:4>, <minecraft:wheat>], <ic2:booze_mug:2>, <ic2:barrel:*>);

// Slime spawning
scripts.jei.requious.add(<assembly:crafting_hints>, { [
  <exnihilocreatio:block_barrel0> | <exnihilocreatio:block_barrel1>, null, null, null, null,
  Bucket('milk'), <minecraft:brown_mushroom> | <minecraft:red_mushroom>,
]: [<entity:minecraft:slime>.asStack(), <minecraft:slime>] });
