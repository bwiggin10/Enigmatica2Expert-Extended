#reloadable
#modloaded zenutils

import crafttweaker.player.IPlayer;
import scripts.do.omnipotence.utils.setAttribute;
import scripts.do.omnipotence.utils.remAttribute;

scripts.do.omnipotence.op.op.onGrant(function(player as IPlayer) as void {
  if (player.world.remote) return;

  // TODO: Both methods not working properly
  // setAttribute(player, 'potioncore.stepHeight', '91578173-6602-4880-b960-2b0a5437f213', 1);
  // player.simulateRightClickItem(<cyclicmagic:food_step>);

  setAttribute(player, 'generic.reachDistance', '31f40f75-5c35-4154-89ea-d8024f208034', 10);
  setAttribute(player, 'generic.knockbackResistance', 'de6fd305-c216-4d0e-8d5b-020534e22789', 1);
  setAttribute(player, 'generic.movementSpeed', 'e6d2ed1e-243d-4684-bd9e-268b7c35153a', 0.1);
  setAttribute(player, 'forge.swimSpeed', '9c1f6fe8-94ed-46ce-9307-6647900ae6ad', 2);
  setAttribute(player, 'generic.attackDamage', '8acc3dda-1db0-466b-9acc-8c7453683fe0', 99);

  server.commandManager.executeCommandSilent(server, '/say # `' ~ player.name
    ~ '` just reached the §e**§lOmnipotence§e**§r ```Congrats!```'
  );
});

scripts.do.omnipotence.op.op.onRevoke(function(player as IPlayer) as void {
  if (player.world.remote) return;

  remAttribute(player, 'generic.reachDistance', '31f40f75-5c35-4154-89ea-d8024f208034');
  remAttribute(player, 'generic.knockbackResistance', 'de6fd305-c216-4d0e-8d5b-020534e22789');
  remAttribute(player, 'generic.movementSpeed', 'e6d2ed1e-243d-4684-bd9e-268b7c35153a');
  remAttribute(player, 'forge.swimSpeed', '9c1f6fe8-94ed-46ce-9307-6647900ae6ad');
  remAttribute(player, 'generic.attackDamage', '8acc3dda-1db0-466b-9acc-8c7453683fe0');

  server.commandManager.executeCommandSilent(server, '/say `' ~ player.name
    ~ '` just lost the §e*§lOmnipotence§e*§r'
  );
});

scripts.do.omnipotence.op.op.onTick(function(player as IPlayer) as void {
  if (player.world.remote) return;
  player.foodStats.addStats(20, 20);
});
