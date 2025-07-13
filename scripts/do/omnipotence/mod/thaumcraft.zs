#reloadable
#modloaded zenutils thaumcraft ctintegration

import crafttweaker.player.IPlayer;

scripts.do.omnipotence.op.op.onGrant(function(player as IPlayer) as void {
  if (player.world.remote) return;
  server.commandManager.executeCommandSilent(server, `/thaumcraft research ${player.name} all`);
});

scripts.do.omnipotence.op.op.onRevoke(function(player as IPlayer) as void {
  if (player.world.remote) return;
  server.commandManager.executeCommandSilent(server, `/thaumcraft research ${player.name} reset`);
});

scripts.do.omnipotence.op.op.onTick(function(player as IPlayer) as void {
  if (player.world.remote) return;
  player.warpNormal = 0;
  player.warpPermanent = 0;
  player.warpTemporary = 0;
});
