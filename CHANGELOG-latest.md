
## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d01d6a8ae7c34a8b6df2fbe41bcb991aea8d70f0)⛏️fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/ore__0.png "Copper Ore") too hard to break
  > Last time when i was refactoring mining level, all Thermal ores got same hardness (break time). This happens because on backend all those blocks have one ID and some configurations like hardness are the same.
  > 
  > Also this change slightly tweak some other blocks (see commit for details)
  > 
  > Related e6ec1891739b8a7d8413a19f3a8c3eb3dd48b75a
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e2b39a8697307512de99fcbfca4131e26b21db53)🏃‍♀️fix `player moved too quickly` on servers
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4c2543b3e8aff8201f604a7fa69516273527263a)🔨Return `Moon Voice` trait to Endorium
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e604b5929dc5e2331fda04df8cf0d9132ad8c4f4)🧙‍♂️disable all Cyclic's minecarts
  > Their movement was glitchy and usage questionable.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/136b6eee8a5028c9221628fc06e8a9496169d702)🧩Revert [Bottle of Wildberry Wine]
  > Seems like RLTweaker cant buff Wine of updated Rustic mod.
  > 
  > Revert c4f9c16550c31c17e1fc2be507df94a769f9f1ad

#### Gear

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/05dfecc20c4d54113a5f49d3bc9a7ccc7a7c7ee1)🔨Trait `Spectre` make effect longer (4s => 9s) to prevent blincking
  > 

#### Recipes

* <img src="https://i.imgur.com/H5UrEUo.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2d77b3d76e36f11cceee27fdb64dd01f08746e64)✏️add missed QMD recipes for new items
  > 

#### Skyblock

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7ad338a92627c6534ad98b488f013690a95c4afd)🌌Fix skyblock players could visit nether
  > Error was accidentally introduced in `v1.60.2`.
  > Here 5ec47e7328f5a86135a65dc7898fece56238e4bd

## Mods changes

### 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/297/106/30/30/637343255955991159.png"            > |            [**Mixin 0.7-0.8 Compatibility**](https://www.curseforge.com/minecraft/mc-mods/mixin-0-7-0-8-compatibility)  <sup><sub>[___MixinCompat-1.1-1.12.2___].jar               </sub></sup><br>Allows mods that use 0.7 or 0.8 mixin to be compatible with each other | I didnt realize but came out that this mod was doing nothing. If I just remove this mod - nothing changes and modpack run as it should be. Discovered [here](https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/500#issuecomment-2998352079).
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/874/755/30/30/638296262646953159.png"            > |                [**Alfheim Lighting Engine**](https://www.curseforge.com/minecraft/mc-mods/alfheim-lighting-engine)     | <nobr>Alfheim-1.5</nobr><br><nobr>Alfheim-1.6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1304/81/30/30/638847932766552243.png"            > |                                  [**Fugue**](https://www.curseforge.com/minecraft/mc-mods/fugue)                       | <nobr>+Fugue-0.19.0</nobr><br><nobr>+Fugue-0.19.5</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1223/434/30/30/638801642158504721.png"           > |                       [**Tinkers' Antique**](https://www.curseforge.com/minecraft/mc-mods/tinkers-antique)             | <nobr>TinkersAntique-1.12.2-2.13.0.200</nobr><br><nobr>TinkersAntique-1.12.2-2.13.0.201</nobr>
-----------


