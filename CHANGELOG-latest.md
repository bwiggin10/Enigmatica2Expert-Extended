# v1.46.0 (2024-10-27)
## Mods changes

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/108/684/30/30/636374315485450120.png"            > |                            [**U Team Core**](https://www.curseforge.com/minecraft/mc-mods/u-team-core)                 | <nobr>u_team_core-forge-1.12.2-2.2.5.305</nobr><br><nobr>u_team_core-forge-1.12.2-2.2.5.319</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/180/855/30/30/636796143936766724.png"            > |                           [**PackagedAuto**](https://www.curseforge.com/minecraft/mc-mods/packagedauto)                | <nobr>PackagedAuto-1.12.2-1.0.14.55</nobr><br><nobr>PackagedAuto-1.12.2-1.0.15.56</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/205/161/30/30/636946414091294708.png"            > |                     [**PackagedExCrafting**](https://www.curseforge.com/minecraft/mc-mods/packagedexcrafting)          | <nobr>PackagedExCrafting-1.12.2-1.0.2.24</nobr><br><nobr>PackagedExCrafting-1.12.2-1.0.2.25</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/648/528/30/30/638050129235150630.png"            > |                               [**RLMixins**](https://www.curseforge.com/minecraft/mc-mods/rlmixins)                    | <nobr>RLMixins-1.3.8</nobr><br><nobr>RLMixins-1.3.9</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/759/528/30/30/638095905122883877.png"            > |                         [**PackagedAstral**](https://www.curseforge.com/minecraft/mc-mods/packagedastral)              | <nobr>PackagedAstral-1.12.2-1.0.2.15</nobr><br><nobr>PackagedAstral-1.12.2-1.0.2.16</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/785/360/30/30/638135438959255507.png"            > |                       [**PackagedDraconic**](https://www.curseforge.com/minecraft/mc-mods/packageddraconic)            | <nobr>PackagedDraconic-1.12.2-1.0.2.17</nobr><br><nobr>PackagedDraconic-1.12.2-1.0.2.18</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/856/836/30/30/638260772226865253.png"            > |                             [**VisualOres**](https://www.curseforge.com/minecraft/mc-mods/visualores)                  | <nobr>visualores-0.2.5</nobr><br><nobr>visualores-0.2.6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/937/632/30/30/638416090890641368.png"            > |            [**Thaumic Tinkerer Unofficial**](https://www.curseforge.com/minecraft/mc-mods/thaumic-tinkerer-unofficial) | <nobr>thaumictinkerer-1.12.2-5.7.1-Unofficial</nobr><br><nobr>thaumictinkerer-1.12.2-5.7.2-Unofficial</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1062/375/30/30/638594947374082619.png"           > |                         [**JEI Area Fixer**](https://www.curseforge.com/minecraft/mc-mods/jei-area-fixer)              | <nobr>jei_area_fixer-1.6.0</nobr><br><nobr>jei_area_fixer-2.0.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1071/348/30/30/638606872011907048.png"           > |              [**Fluid Interaction Tweaker**](https://www.curseforge.com/minecraft/mc-mods/fluid-interaction-tweaker)   | <nobr>fluidintetweaker-1.4.0-preview-1</nobr><br><nobr>fluidintetweaker-1.4.0-preview-2</nobr>
-----------

## ✨ New Features


#### Gear

* <img src="https://i.imgur.com/IOAi9XP.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7bd90e47b24ed9a3b3b126883e5d5b114b4a1709)🔨Considering trait power for TCon calculations
  > Thanks for @TamatLT for providint table of trait powers.
  > 
  > Now, sorting in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/book__0.png "Materials and You") will consider not only stats but also traits that material could give.
  > 
  > This will update tables of materials in [E2EE Wiki](https://github.com/Krutoy242/Enigmatica2Expert-Extended/blob/master/dev/tools/tcon/stats/Stats.csv) pages.
  > 
  > Also, mobs will now more precisely spawn with appropriate materials.

#### Hei

* <img src="https://i.imgur.com/1nv7lUL.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5ae08af3fd24b3d55838a17ae4b4da8a6e811102)🏪Add all variations in [Transmuter's stone] tab
  > Now they will cycle all possible transmutations, not only Ore blocks.
  > 
  > (some ores like Iron and Uranium could miss few variants, but they all work in reality)

#### Portal_spread

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c848338928da38be99a0704e1e7d0d877069c4cb)⛑️![](https://github.com/Krutoy242/mc-icons/raw/master/i/contenttweaker/conglomerate_of_coal__0.png "Conglomerate Of Coal") now increasing radius non-lineary
  > +3 on 1 block, +12 on 2, +27 on 3 and +48 on 4.

#### Recipes

* <img src="https://i.imgur.com/tSBEo7l.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/40513be533d221c2c7893f528eb0e7c4523eeaaf)✏️add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/ic2superheated_steam.png "Superheated Steam") recipe
  > To make Fluid IC2 reactor viable without 150 heat exchangers.

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/162edc0f2e282b450c50ed5a16d20c4e51156ddc)🐛Fix Spectre dimension tp stall
  > Players on servers can experience 15 minutes stalls after teleporting to Spectre dimension.
  > I was fixed this recently with a temporary creative mode, but now `WaitingIdly` suggested a more proper mixin script.
  > 
  > Related to https://github.com/ACGaming/UniversalTweaks/issues/460
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1da16374cd4bb53ea1043d91c2f977cef32439a7)🐦Fix mixin error on server
  > No functional problems with it, just a error.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b41f3ae4cb346a34c274b662364a2dc8c7f679c3)🔄Update Thaumcraft aspects in JEI
  > 

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4ba698fa5232f0d34298aa450e37a5414d5dde78)🏋️whitelist carryon for all `Packaged-` blocks
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7dea28601e6c8f9141fb5e834ffdf5ee28caa23d)🔌![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/te__31.png "Liquid Heat Exchanger") make coolant takes x2 more heat
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4f793876c5f3c28ffa4062979ae3581754a4f3c0)🧩Enable some `rlmixins` config options
  > - Force OTG No Set Spawn
  > - OTG CustomStructureCache Crash Delay

#### Portal_spread

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5d895efe68c9334695bbe22b91e788469fb1cd8a)⛑️fix not converting some modded blocks after update
  > Fixes bug when after several modpack updates, some blocks like ![](https://github.com/Krutoy242/mc-icons/raw/master/i/actuallyadditions/block_misc__3.png "Black Quartz Ore") doesnt converted into respective Nether Ore.
  > 
  > Technical info: blocks to convert stored by their numerical ID, and numerical ID of blocks can vary on game load and world load.

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bcc1e3c26b96a3d2d50f8ea37cbfc8c35fd35a3a)📖![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/bellows__0.png "Arcane Bellows") fix ru/en swapped translations
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5b6b7ec9372f77b4a5071c9145aece78c478ef37)📖Fix player get "Now you can visit the Nether" message even if already can
  > 

#### Recipes

* <img src="https://i.imgur.com/mqb03Cs.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4924d345171cd8376ce81fc91363e86e50927568)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumicenergistics/arcane_terminal__0.png "Arcane Crafting Terminal") sync with harder recipe
  > 



