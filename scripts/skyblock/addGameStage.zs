#modloaded gamestages
#priority -1
#reloadable

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;

events.onPlayerLoggedIn(function (e as crafttweaker.event.PlayerLoggedInEvent) {
  if (e.player.world.isRemote()) return;

  val data as IData = e.player.data.enigmatica;
  val logCount = (!isNull(data) && !isNull(data.logCount)) ? data.logCount.asInt() + 1 : 1;

  // First login ever
  if (logCount == 1) onFirstLogin(e);

  // Other logins
  e.player.update({ enigmatica: { logCount: logCount } });
  onEachLogin(e, logCount);
});

function onFirstLogin(e as crafttweaker.event.PlayerLoggedInEvent) as void {
  if (e.player.world.worldType == 'voidworld' && e.player.world.dimension == 3 && !e.player.hasGameStage('skyblock')) {
    grant(e.player);
  }
}

function onEachLogin(e as crafttweaker.event.PlayerLoggedInEvent, logCount as int) as void {
  if (logCount == 2 && e.player.hasGameStage('skyblock')) {
    showWithDelay(e.player, 'tooltips.dim_stages.remind_skyblock');
  }
}

function grant(player as IPlayer) as void {
  player.addGameStage('skyblock');
  showWithDelay(player, 'tooltips.dim_stages.enter_skyblock');

  // Add Haste when player join Skyblock world for the first time
  player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(20 * 60 * 60 * 3, 3));
}

function showWithDelay(player as IPlayer, lang as string) {
  player.world.catenation().sleep(20 * 10).then(function (world, ctx) {
    player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(lang));
  }).start();
}
