#modloaded requious forestry
#priority -100

import mods.requious.AssemblyRecipe;
import mods.requious.ComponentFace;
import mods.requious.SlotVisual;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val o = <assembly:adv_bee_analyzer>;
o.setEnergySlot(4,0,ComponentFace.all(),2000000).setAccess(true,false).setGroup('energy');
o.setFluidSlot(4,1,ComponentFace.all(),20000).setAccess(true,false).setGroup('fluid_input');
o.setDecorationSlot(4,2,SlotVisual.create(1,1).addPart('requious:textures/gui/assembly_gauges.png',0,8));
for _y in 0 .. 4 {
  for _x in 0 .. 4 {
    o.setItemSlot(_x,_y + 1,ComponentFace.all(),64).setAccess(true,false).setGroup('input');
    o.setItemSlot(_x + 5,_y + 1,ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup('output');
  }
}

o.addRecipe(AssemblyRecipe.create(function (c) {
  c.addItemOutput('output', c.getItem('bee').updateTag({ IsAnalyzed: 1 as byte }));
})
  .requireItem('input', (<forestry:bee_queen_ge> | <forestry:bee_princess_ge> | <forestry:bee_drone_ge>).marked('bee'))
  .requireFluid('fluid_input', <liquid:for.honey> * 100)
  .requireEnergy('energy', 10000)
);
