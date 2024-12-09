# v1.51.0 (2024-12-09)

## Mods changes

### 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/1068/994/30/30/638603711520444197.jpg"           > |                          [**CustomFishing**](https://www.curseforge.com/minecraft/mc-mods/customfishing)                <sup><sub>customfishing-0.1.2.jar                          </sub></sup><br>CustomFishing is a CraftTweaker addon that allows users to add fishing conditions using scripts. For example, you can set a 50% chance of catching an apple when fishing in lava. | This mod making unable to fish in vanilla water.
-----------



## ⚡ Performance Improvements

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bbe52f5ec26e2e0872f7ed74b4dc7c1535ac5659)⚡Rewrite custom particle events for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumadditions/mithminite_scythe__0__46769d22.png "Mithminite Scythe")
  > Improve particle performance when using Scythe and remove log printing for every particle event.
  > 
  > Related: 2ce55bfae16bbc8b3014f54c3df0c892b91d5e3c

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e1f29e8a2dcb5bd317857d9ac417ffb23919ac31)🌍Fix Nether Portal can't be lit in Dim3 (skyblock)
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c0733032ee9ba4eefa7640d3d357b89e0149bc60)💥Fix crash with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/aeadditions/fluidfiller__0.png "ME Fluid Auto Filler")
  > Disable StellarCore config option `AsyncItemStackCapabilityInit` and enable CensoredASM option `delayItemStackCapabilityInit` instead.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/66505777ccfe3bc5df99e0bffcd925261c4d6230)🧤Improve Item display in chat for IC2 items and blocks when hand over items
  > 

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e0d18b6663978e3efc6215fd4ecb3ba1faa7ff7d)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/large_plate__0__11923773.png "Advanced Alloy Large Plate") add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/metal_multiblock__0.png "Metal Press") recipe
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/441
* <img src="https://i.imgur.com/ZsphzVc.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1afab2ccf6152cbafb7a7a5175c2ff71793b57d5)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania/blackholetalisman__0__f62.png "Black Hole Talisman") cheaper
  > 
* <img src="https://i.imgur.com/Zo7SRUB.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/357c818ca43c5c339e943fc78cc08450437ce814)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/metal_device1__13.png "Garden Cloche") buff
  > Now recipe does not require ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/basalt__0.png "Basalt Sediment") and high-tech fluids can buff Cloche speed up to x16 times (about 1 growth / sec).
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/95d2113828b04ddaefdbaf359f4c6edd4be00aed)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__162.png "Invar Ingot") not consumed second ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/iron_ingot__0.png "Iron Ingot") in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/metal_multiblock__13.png "Arc Furnace")
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7a2a947792a4df95dfccc6cb01bb4ef820d87a80)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/environmentaltech/modifier_resistance__0.png "Resistance Modifier") fix uncraftable sometimes
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d555b9e2e8095ac71cc714f0eb4f433ce7afaa34)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/ingredient__12.png "Spectre String")![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/crafting__23.png "Mystical String")![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/spectrecoil_normal__0.png "Spectre Coil") cheaper
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3d1555d659c8ba7246e01e1161fd70001523303e)✏️Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalexpansion/machine__6__1b7c6a95.png "Magma Crucible (Basic)") rec for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/quicksilver_essence__0.png "Quicksilver Essence") and [Sky Stone Essence]
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5263e019bd15fde802f0406d8157c24d40c31b41)✏️replace wrong IC2 dusts/ores from ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crafting__24.png "Scrap Box")
  > 

#### Tweaks

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0ebcdb62902e8fb43b6027246e8f3b243e06aac1)⚙Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/actuallyadditions/block_grinder__0.png "Crusher")
  > Remove Crusher since its whole functionality copied with EU2 crusher that actually better since can be upgraded.



