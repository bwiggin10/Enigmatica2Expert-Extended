# v1.47.0 (2024-11-02)
## Mods changes
### 🟢 Added Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/1010/387/30/30/638534013587034382.png"           > |                    [**NCO Java Legacy Lib**](https://www.curseforge.com/minecraft/mc-mods/nco-java-legacy-lib)          <sup><sub>NCOLegacyLib-1.12.2-1.2.jar                      </sub></sup><br>An API consisting of a collection of legacy classes for use in NCO addons
<img src="https://media.forgecdn.net/avatars/thumbnails/1109/618/30/30/638660579625539174.png"           > |                       [**Backpack Display**](https://www.curseforge.com/minecraft/mc-mods/backpack-display)             <sup><sub>backpackdisplay-1.1.jar                          </sub></sup><br>A mod to show what&#x27;s in your backpacks, drawers, or any similar containers
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/92/854/30/30/636258666554688823.png"             > |                        [**Xaero's Minimap**](https://www.curseforge.com/minecraft/mc-mods/xaeros-minimap)              | <nobr>Xaeros_Minimap_24.5.0_Forge_1.12</nobr><br><nobr>Xaeros_Minimap_24.6.1_Forge_1.12</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/220/544/30/30/637020855283796863.jpeg"           > |               [**NuclearCraft: Overhauled**](https://www.curseforge.com/minecraft/mc-mods/nuclearcraft-overhauled)     | <nobr>NuclearCraft-2o.6.2-1.12.2</nobr><br><nobr>nuclearcraft-1.12.2-2o.7.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/240/433/30/30/637120769373275944.png"            > |                                [**Trinity**](https://www.curseforge.com/minecraft/mc-mods/trinity)                     | <nobr>Trinity-1.4.b</nobr><br><nobr>Trinity-1.12.2-1.5.f</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/248/435/30/30/637168261428598002.png"            > |                                    [**QMD**](https://www.curseforge.com/minecraft/mc-mods/qmd)                         | <nobr>QMD-1.3.5-1.12.2</nobr><br><nobr>QMD-1.4.1-1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.20.10</nobr><br><nobr>zenutils-1.20.12</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/641/454/30/30/638043757664856777.png"            > |                       [**Universal Tweaks**](https://www.curseforge.com/minecraft/mc-mods/universal-tweaks)            | <nobr>UniversalTweaks-1.12.2-1.12.0</nobr><br><nobr>UniversalTweaks-1.12.2-1.13.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/648/528/30/30/638050129235150630.png"            > |                               [**RLMixins**](https://www.curseforge.com/minecraft/mc-mods/rlmixins)                    | <nobr>RLMixins-1.3.9</nobr><br><nobr>RLMixins-1.3.13</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/983/99/30/30/638491305320584710.png"             > |                                  [**Fugue**](https://www.curseforge.com/minecraft/mc-mods/fugue)                       | <nobr>+Fugue-1.12.2-0.16.3</nobr><br><nobr>+Fugue-1.12.2-0.16.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1071/348/30/30/638606872011907048.png"           > |              [**Fluid Interaction Tweaker**](https://www.curseforge.com/minecraft/mc-mods/fluid-interaction-tweaker)   | <nobr>fluidintetweaker-1.4.0-preview-2</nobr><br><nobr>fluidintetweaker-1.4.1</nobr>
-----------

## ✨ New Features


#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0f3ef4a7060d27cde36cb6f3e0cc9e2888d40a70)📖Add mandatory `Schematica` quest in NC chapter
  > Since its highly recommended to use Schematica for NC builds, now to progress player must open one of Schematica GUIs.
  > 
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/428

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/09d62d1d776b3630a57903eed5105868ed1a7d39)💥Fix crash on attaching ![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/infinity_furnace__0.png "Infinity Furnace") to RTG
  > .. or any other IC2 power source.
  > 
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/369

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fdfeff34278456b54ffc573c20686188c83696c6)🧩Enable some `rlmixins` config options
  > - OTG Save To Disk Crash Checks

#### Docs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fd3ecf8aace908019b05c855e7651722980a5e3e)📝Remove tip `You can spill Milk in The Nether`
  > 

#### Mods

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/31aa1ee835a8d326202c6505450e3cd5bca0246f)🦯![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania/missilerod__0.png "Rod of the Unstable Reservoir") remove [Caeles] aspect
  > Recipe was used to have Gaia ingots in it, but after a nerf I forgot to change aspects too.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/dda80b6f7c3ebd891a6cdea9a40ffaae5971ba78)🦯Allow ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/celestial_notes__0.png "Celestial Notes") to get in Dim3 (skyblock)
  > 

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/30e8ad208924166d5319e6e906ac743a969dc503)📖Fix MaterialSystem localization and some typos
  > > Contributed by [ice](44568304+icepony@users.noreply.github.com)
  >
  > - Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/heavy_metal.png "Molten Heavy Metal") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/cheese.png "Molten Cheese") localization
  > - Fix technical typo in quest
  > - Fix `Aveary` typo
  > - Improve number format
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1c88952491618f0e419fe6b85ec257bb516ab14c)📖Update Chinese localization
  > > Contributed by [ice](44568304+icepony@users.noreply.github.com)
  >
  > 

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5900e193ffd64b769da2783f6887257b6a96f1c3)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/rats/plastic_waste__0.png "Plastic Waste") recipe remove Liquid Dirt sub-product
  > 
* <img src="https://i.imgur.com/uyepoNt.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/097a5c84783fcb391b5b8e1a88de2d7bc8914d76)✏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/alchemy_table__0.png "Alchemy Table") recipes not consuming all ingredients
  > Fix only 1 of each ingredients was required, even if recipe show 32 in HEI. Now all recipes that used more than 1 item was changed.



