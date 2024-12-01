# v1.49.0 (2024-12-01)
## Mods changes
### 🟢 Added Mods

Icon | Summary | Reason
----:|:--------|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/1124/518/30/30/638681479315906754.png"           > |                        [**Backpack Opener**](https://www.curseforge.com/minecraft/mc-mods/backpack-opener)              <sup><sub>bpopener-1.0.jar                                 </sub></sup><br>A client-side mod to make using handheld GUI items like backpacks and books quicker | 
-----------

### 🟡 Updated Mods

🛈 Sometimes Old / New file names are the same, when mod is updated, but file name wasnt changed. Or when file was reuploaded.

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/417/700/30/30/637642020488223140.png"            > |                          [**RandomTweaker**](https://www.curseforge.com/minecraft/mc-mods/randomtweaker)               | <nobr>RandomTweaker-1.4.7</nobr><br><nobr>RandomTweaker-1.4.7</nobr>
-----------

## ✨ New Features

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a744c94dad0092d5c8af5d9cb601f26af1239197)![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/dispenser__0.png "Dispenser") now can use ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/activation_crystal__0.png "Weak Activation Crystal")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/activation_crystal__1.png "Awakened Activation Crystal")
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/aa6bd051eedb41f8398c5f3a9326743833506f42)✈️add `/perf` command for performance info
  > - `/perf loaders` - show all ticking chunkloaders from predefined list
  > - `/perf chunk` - show amount of loaded chunks

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/65664ec5856ea6c24529a576b6b8123a72fb692b)⏰![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/magic_log_core__0.png "Timewood Clock") now self-destroy on tree damage
  > Now, if Tree Of Time cant grow completely, you prune its leaves or break tree trunk blocks - its self-destruct, without dropping core block.
  > 
  > This will prevent abusing stacking with automated users enabling clocks again and again.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9d2d9b4163fe4292243fd3a07fad9606b74dedaf)📝![](https://github.com/Krutoy242/mc-icons/raw/master/i/pointer/pointer__0.png "Pointer") improve block preview
  > Now support IC2 machines.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/57a189a096e4a1ed613f1b7220e43b5b1c13f6ad)📝Add icons for items in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/cyclicmagic/storage_bag__0.png "Storage Bag")
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4d8f8c59824334ce905771968f03c705343907f3)🖼️fix coin textures
  > 

#### Gear

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/97f00b64dee7dc2945662f6a48cb86bdd4b7e3e6)⛏️balance ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumictinkerer/kamiresource__3.png "Ichorium Ingot")
  > - Mining level is now `9`
  > - Reduce x2 durability
  > - Handle modifier set to 1.2

#### Mods

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bbaff99292ec9ab74502816b18fd12553ef9ccd8)🐛Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rustic/brewing_barrel__0.png "Brewing Barrel") mutating tank items
  > Fix tanks like ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/machineblock2__11__9a743a0a.png "Basic Fluid Tank") turned into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/machineblock2__0.png "Rotary Condensentrator") inside Barrel slots.
  > 
  > Thanks @friendlyhj for this mixin code!
  > 
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/435  
  > Fix https://github.com/cadaverous-eris/Rustic/issues/316  
  > Fix https://github.com/cadaverous-eris/Rustic/issues/259  

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/42910ea63d5d360fa6e20bf51470cda330cfb172)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/crafting_material__4.png "Dissipation Charge")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/iodine_capsule__0.png "Iodine Capsule") remove duplicate recipes
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/837772bcd9fb32f9fc7d2bec77216b1b6936fd75)✏️fix non-vanilla wood logs output x4 planks
  > (Related to 40f3b8)
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/85777c894c844fa00e30970bf82e1869b4cdda17)✏️Rebalance ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__14.png "Pulsating Crystal")
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/compound__9.png "Dimensional Blend") now can be made in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_sag_mill__0.png "SAG Mill")
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/compound__9.png "Dimensional Blend") cant be made with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/exnihilocreatio/item_mesh__1.png "String Mesh")
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__14.png "Pulsating Crystal") now require Blend instead of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/biomesoplenty/biome_essence__0.png "Biome Essence")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/154aed0bb8f20c2d2d5729b3410abf0eb2c3e05a)✏️replace ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/dust__8.png "Iron Dust") output with correct one
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/afe555369850927cf8af72b2815d3e6eb171c6d1)🦯![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumadditions/chester__0.png "Chester") remove recipe and hide
  > - It dupes
  > - Hard to pickup
  > - Randomly dissapear with all items inside

#### Tools

* <img src="https://i.imgur.com/f7YewqT.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7129f829b3a8078ec5a21b838dd81a97d1d4b377)⛏️add icons to materials with shards instead of actual items
  > Added icons for materials:
  > - fusewood, bloodwood, ghostwood, darkwood, xu_magical_wood, xu_demonic_metal, xu_enchanted_metal, xu_evil_metal

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/05e2a5303dc6bb5dcc5108e69f3218306ca040b6)🌍50% lower spawn of End Islands in Overworld
  > 



