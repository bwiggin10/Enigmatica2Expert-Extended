#loader contenttweaker
#modloaded ctintegration thaumcraft crafttweakerutils

import crafttweaker.block.IBlock;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.contenttweaker.conarm.ArmorTraitBuilder;
import mods.contenttweaker.conarm.ExtendedMaterialBuilder;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.ctutils.utils.Math.ceil;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.sqrt;

import scripts.cot.trait.utils.getArmorMatsAmount;
import scripts.cot.trait.utils.getItemMatAmount;

/*
Some taken from: wilderness-minecraft
https://github.com/badmonkey/wilderness-minecraft/blob/f32102d158566de9d346034b35c2f6226d369ff9/forge1.12/wilderness/scripts/content/traits_tcon.zs
*/

//
// blindrage
//
val rage = TraitBuilder.create('blindrage');
rage.color = 0x080808;
rage.localizedName = 'Blind Rage';
rage.localizedDescription = '§oWho said you needed to see your enemies?\n§rDeal double damage when blinded';
rage.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (attacker.isPotionActive(<potion:minecraft:blindness>)) {
    return newDamage * 2.0;
  }
  else {
    return newDamage;
  }
};
rage.register();

//
// darkness
//
val dark = TraitBuilder.create('darkness');
dark.color = 0x332C3B;
dark.localizedName = 'Eternal Darkness';
dark.localizedDescription = '§oJoin the dark side...\n§rYour tool loves the dark so much; it does more damage in the dark.';
dark.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  val light = attacker.world.getBrightness(attacker.getX(), attacker.getY(), attacker.getZ());
  return newDamage * (2.0f - light as float / 15.0f);
};
dark.register();

//
// dire
//
val dire = TraitBuilder.create('dire');
dire.color = 0x54514A;
dire.localizedName = 'Dire-Hit';
dire.localizedDescription = "§oIt's super effective!\n§rYour tool will always land critical hits so long as you are at full health!";
dire.calcCrit = function (trait, tool, attacker, target) {
  return attacker.health >= attacker.maxHealth;
};
dire.register();

//
// lifecycle
//
val life = TraitBuilder.create('lifecycle');
life.color = 0xFF2010;
life.localizedName = 'Cycle of Life';
life.localizedDescription = '§oFrom one to another.\n§rWhen your tool is damaged, you are healed for the damaged amount.';
life.onToolDamage = function (trait, tool, unmodifiedAmount, newAmount, holder) {
  holder.heal(newAmount);
  return newAmount;
};
life.register();

//
// antimagic
//
val antimagic = ArmorTraitBuilder.create('antimagic');
antimagic.color = 0x000000;
antimagic.localizedName = 'Anti-Magic';
antimagic.localizedDescription = "§oNihilistic!\n§rYour armor doesn't believe in potions, and refuses to be affected by any potion effects; good or bad.";
antimagic.onHurt = function (trait, armor, player, source, damage, newDamage, evt) {
  if (armor.damage < armor.maxDamage && source.isMagicDamage()) {
    evt.cancel();
  }
  return newDamage;
};
antimagic.onArmorTick = function (trait, armor, world, player) {
  if (world.getWorldTime() % 10 == 0) player.clearActivePotions();
};
antimagic.register();

//
// darkside
//
val darkdefense = ArmorTraitBuilder.create('darkside');
darkdefense.color = 0x332C3B;
darkdefense.localizedName = 'The Dark Side';
darkdefense.localizedDescription = '§oUnder the cover of darkness!\n§rYour armor loves the dark so much; you take less damage when in darkness.';
darkdefense.onHurt = function (trait, armor, player, source, damage, newDamage, event) {
  return newDamage * (0.75 + 0.25 * player.world.getBrightness(player.x, player.y, player.z) / 15.0);
};
darkdefense.register();

//
// mentor
//
val mentor = TraitBuilder.create('mentor');
mentor.color = 0x216E2A;
mentor.localizedName = game.localize('e2ee.tconstruct.material.mentor.name');
mentor.localizedDescription = game.localize('e2ee.tconstruct.material.mentor.description');
mentor.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (!attacker instanceof IPlayer) return newDamage;
  val player as IPlayer = attacker;
  val level = getItemMatAmount(tool, 'essence_metal');
  if (level <= 0) return newDamage;
  player.xp = max(0, player.xp - level);
  // player.removeExperience((player.getTotalXP() as float * (0.03f * level as float) + 1.0f) as int);
  return newDamage + sqrt(player.xp * level);
};
mentor.register();

var trait_armor = ArmorTraitBuilder.create('apprentice');
trait_armor.color = 0x216E2A;
trait_armor.localizedName = game.localize('e2ee.tconstruct.material.apprentice.name');
trait_armor.localizedDescription = game.localize('e2ee.tconstruct.material.apprentice.description');
trait_armor.onHurt = function (trait, armor, victim, source, damage, newDamage, evt) {
  var level = 1;
  if (victim instanceof IPlayer) {
    val player as IPlayer = victim;
    level = getArmorMatsAmount(player, 'essence_metal');
    player.addExperience((ceil(newDamage as double / 10.0) * level as double) as int);
  }
  return newDamage + (newDamage as double * (0.1 * level as double)) as int;
};
trait_armor.register();

//
// Fireproof Wood
//
val m = ExtendedMaterialBuilder.create('fireproof');
m.color = 0xA64D00;
m.craftable = true;
m.castable = false;
m.representativeItem = <item:contenttweaker:woodweave_singularity>;
m.addItem(<item:contenttweaker:woodweave_singularity>, 1, 144);
m.localizedName = game.localize('e2ee.tconstruct.material.fireproof.name');
m.addHeadMaterialStats(100, 4, 3, 3);
m.addHandleMaterialStats(1.5, 100);
m.addExtraMaterialStats(50);
m.addBowMaterialStats(1.0 / 1.25, 1, 0);
m.addProjectileMaterialStats();
m.addCoreMaterialStats(3, 10);
m.addPlatesMaterialStats(1.0, 20, 1);
m.addTrimMaterialStats(4);
m.register();

//
// spectre
//
val spectre = ExtendedMaterialBuilder.create('spectre');
spectre.color = 0x9CC1CE;
spectre.craftable = false;
spectre.castable = true;
spectre.representativeItem = <item:randomthings:ingredient:3>;
spectre.liquid = <liquid:spectre>;
spectre.addItem(<ore:ingotSpectre>);
spectre.localizedName = game.localize('e2ee.tconstruct.material.spectre.name');
spectre.addHeadMaterialStats(400, 4.2, 6.0, 7);
spectre.addHandleMaterialStats(1.4, -50);
spectre.addExtraMaterialStats(64);
spectre.addBowMaterialStats(1.0f / 1.5f, 1.0, 2.5);
spectre.addProjectileMaterialStats();
spectre.addCoreMaterialStats(200, 23.3);
spectre.addPlatesMaterialStats(1.6, 100, 2);
spectre.addTrimMaterialStats(70);
spectre.register();

static spectreUpdateTime as int = 80;
static hasPotioncore as bool = loadedMods.contains('potioncore');

function spectreMechanic(world as IWorld, player as IPlayer, level as int) as void {
  if (world.isRemote()) return;
  if (isNull(player)) return;
  val levelMult = hasPotioncore ? 1 : 3;
  val newEffect = hasPotioncore ? <potion:potioncore:reach> : <potion:cyclicmagic:magnet>;
  if (!player.isPotionActive(newEffect)) {
    player.addPotionEffect(newEffect.makePotionEffect(spectreUpdateTime, level * levelMult - 1));
    return;
  }
  val existEffect = player.getActivePotionEffect(newEffect);
  player.addPotionEffect(newEffect.makePotionEffect(spectreUpdateTime, existEffect.amplifier + level * levelMult));
}

val spectre_trait = TraitBuilder.create('spectre');
spectre_trait.color = 0x9CC1CE;
spectre_trait.localizedName = game.localize('e2ee.tconstruct.material.spectre.name');
spectre_trait.localizedDescription = game.localize('e2ee.tconstruct.material.spectre.description');
spectre_trait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (!isSelected) return;
  if (world.getWorldTime() % spectreUpdateTime != 0) return;
  if (!owner instanceof IPlayer) return;
  val player as IPlayer = owner;
  spectreMechanic(world, player, getItemMatAmount(tool, 'spectre'));
};
spectre_trait.register();

val spectre_armor = ArmorTraitBuilder.create('spectre');
spectre_armor.color = 0x9CC1CE;
spectre_armor.localizedName = game.localize('e2ee.tconstruct.material.spectre.name');
spectre_armor.localizedDescription = game.localize('e2ee.tconstruct.material.spectre.description');
spectre_armor.onAbility = function (trait, level, world, player) {
  if (world.getWorldTime() % spectreUpdateTime != 0) return;
  spectreMechanic(world, player, getArmorMatsAmount(player, 'spectre'));
};
spectre_armor.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
var mat = MaterialBuilder.create('spectre_string');
mat.color = 0x90A4AE;
mat.craftable = true;
mat.castable = false;
mat.representativeItem = <item:randomthings:ingredient:12>;
mat.addItem(<item:randomthings:ingredient:12>);
mat.localizedName = game.localize('e2ee.tconstruct.material.spectre_string.name');
mat.addBowStringMaterialStats(2.2);
mat.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
mat = MaterialBuilder.create('alpha_fur');
mat.color = 0x2196F3;
mat.craftable = true;
mat.castable = false;
mat.representativeItem = <item:twilightforest:alpha_fur>;
mat.addItem(<item:twilightforest:alpha_fur>);
mat.localizedName = game.localize('e2ee.tconstruct.material.alpha_fur.name');
mat.addHeadMaterialStats(300, 2.0, 1.0, 1);
mat.addHandleMaterialStats(0.1, 100);
mat.addExtraMaterialStats(80);
mat.addBowMaterialStats(1.0, 0.3, 1.0);
mat.addProjectileMaterialStats();
mat.register();

trait_armor = ArmorTraitBuilder.create('alpha_fur');
trait_armor.color = 0x2196F3;
trait_armor.localizedName = game.localize('e2ee.tconstruct.material.alpha_fur.name');
trait_armor.localizedDescription = game.localize('e2ee.tconstruct.material.alpha_fur.description');
trait_armor.onHurt = function (trait, armor, player, source, damage, newDamage, evt) {
  if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
    val attacker as IEntityLivingBase = source.getTrueSource();
    attacker.addPotionEffect(<potion:twilightforest:frosted>.makePotionEffect(60, 5));
  }
  return newDamage;
};
trait_armor.register();

val trait = TraitBuilder.create('alpha_fur');
trait.color = 0x2196F3;
trait.localizedName = game.localize('e2ee.tconstruct.material.alpha_fur.name');
trait.localizedDescription = game.localize('e2ee.tconstruct.material.alpha_fur.description');
trait.afterHit = function (trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
  target.addPotionEffect(<potion:twilightforest:frosted>.makePotionEffect(60, 4));
};
trait.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// -------------------------------
// Grinding Tait
// -------------------------------
val grindingTrait = ArmorTraitBuilder.create('grinding');
grindingTrait.color = 0x444450;
grindingTrait.localizedName = game.localize('e2ee.tconstruct.material.grinding.name');
grindingTrait.localizedDescription = game.localize('e2ee.tconstruct.material.grinding.description');
grindingTrait.onFalling = function (trait, armor, player, event) {
  if (event.entityLivingBase.world.isRemote()) return;
  scripts.cot.trait.grinding.onFalling(armor, player);
};
grindingTrait.onAbility = function (trait, level, world, player) {
  if (world.isRemote()) return;
  scripts.cot.trait.grinding.onAbility(trait, level, world, player);
};
grindingTrait.register();

// -------------------------------
// Tic + Conarm Material
// -------------------------------
val heavy = ExtendedMaterialBuilder.create('heavy');

heavy.liquid = <liquid:heavy_metal>;
heavy.castable = true;
heavy.craftable = false;

heavy.color = 0x444450;
heavy.addItem(<item:mechanics:heavy_ingot>);
heavy.representativeItem = <item:mechanics:heavy_ingot>;
heavy.localizedName = game.localize('e2ee.tconstruct.material.heavy.name');
heavy.itemLocalizer = function (thisMaterial, itemName) {
  return game.localize('e2ee.tconstruct.material.heavy.name') + ' ' + itemName;
};
heavy.addHeadMaterialStats(-200, 0.1, 15.0, 5);
heavy.addExtraMaterialStats(-40);
heavy.addHandleMaterialStats(0.5, -10);
heavy.addBowMaterialStats(0.1, 0.1, 15);
heavy.addArrowShaftMaterialStats(0.2, -10);

heavy.addCoreMaterialStats(10, 2.5);
heavy.addPlatesMaterialStats(0.3, 5, 0);
heavy.addTrimMaterialStats(0.4);

heavy.addMaterialTrait('heavy', 'head');
heavy.addMaterialTrait('heavy', 'core');
heavy.addMaterialTrait('heavy', 'plates');
heavy.addMaterialTrait('grinding_armor');
heavy.addProjectileMaterialStats();
heavy.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// -------------------------------
// Axe Tait
// -------------------------------
var t = TraitBuilder.create('axing');
t.color = 0xA3B391;
t.localizedName = game.localize('e2ee.tconstruct.material.axing.name');
t.localizedDescription = game.localize('e2ee.tconstruct.material.axing.description');
t.register();

t = TraitBuilder.create('axing2');
t.color = 0xC4D6AE;
t.localizedName = game.localize('e2ee.tconstruct.material.axing2.name');
t.localizedDescription = game.localize('e2ee.tconstruct.material.axing2.description');
t.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
