#reloadable
#priority 2000
#modloaded zenutils

import crafttweaker.player.IPlayer;
import crafttweaker.world.IVector3d;
import crafttweaker.world.IWorld;
import native.net.minecraft.util.EnumParticleTypes;
import crafttweaker.util.Math.sin;
import crafttweaker.util.Math.cos;

zenClass Op {
  zenConstructor() {}

  var onGrantList as [function(IPlayer)void] = [] as [function(IPlayer)void];
  function onGrant(fnc as function(IPlayer)void) as void { onGrantList += fnc; }

  var onTickList as [function(IPlayer)void] = [] as [function(IPlayer)void];
  function onTick(fnc as function(IPlayer)void) as void { onTickList += fnc; }

  var onRevokeList as [function(IPlayer)void] = [] as [function(IPlayer)void];
  function onRevoke(fnc as function(IPlayer)void) as void { onRevokeList += fnc; }

  var isOmnipotentList as [function(IPlayer)bool] = [] as [function(IPlayer)bool];
  function isOmnipotent(fnc as function(IPlayer)bool) as void { isOmnipotentList += fnc; }

  function grant(player as IPlayer) as void {
    for fnc in onGrantList { fnc(player); }
    effect(player);
  }

  function tick(player as IPlayer) as void {
    for fnc in onTickList { fnc(player); }
  }

  function revoke(player as IPlayer) as void {
    for fnc in onRevokeList { fnc(player); }
  }

  function isPlayerOmnipotent(player as IPlayer) as bool {
    if (isOmnipotentList.length <= 0) return false;
    for fnc in isOmnipotentList {
      if (fnc(player)) return true;
    }
    return false;
  }

  function isPendingOmnipotentce(player as IPlayer) as bool {
    if (isOmnipotentList.length <= 0) return false;
    var isPass = false;
    var isFail = false;
    for fnc in isOmnipotentList {
      if (fnc(player)) isPass = true;
      else isFail = true;
      if (isPass && isFail) return true;
    }
    return false;
  }

  // ///////////////////////////////////////////////////////////////////////////////////////
  // Private
  // ///////////////////////////////////////////////////////////////////////////////////////

  function effect(player as IPlayer) as void {
    if (!player.world.remote) {
      val cat = player.world.catenation();
      val pi = 3.1415926535897931;
      val vel = IVector3d.create(0.1, 0.1, 0.1);
      for i in 0 .. 60 {
        val a = 0.1 * i;
        cat.then(function(w, c) {
          particles(player.world, player.x + cos(a) * a, player.y + a / 2, player.z + sin(a) * a, vel, 10);
          particles(player.world, player.x + cos(a+pi) * a, player.y + a / 2, player.z + sin(a+pi) * a, vel, 10);
        });
      }
      cat.start();
    }
  }

  var particles as function(IWorld,double,double,double,IVector3d,int)void
    = function (world as IWorld, x as double, y as double, z as double, vel as IVector3d, amount as int) as void {
      if (!world.remote) {
        (world.native as native.net.minecraft.world.WorldServer).spawnParticle(
          EnumParticleTypes.VILLAGER_HAPPY,
          x, y, z, amount, 0.1, 0.1, 0.1, 0.1, 0);
      }
    };

  val prevHasOmnipotence as bool[IPlayer] = {};
}
static op as Op = Op();

events.register(function (e as crafttweaker.event.PlayerTickEvent) {
  if (e.phase != 'END' || e.player.world.provider.worldTime % 10 != 0) return;

  val player = e.player;
  
  if (op.isPendingOmnipotentce(player))
    op.grant(player);
  else if (op.isPlayerOmnipotent(player))
    op.tick(player);
});

events.register(function (e as crafttweaker.event.PlayerBreakSpeedEvent) {
  val player = e.player;
  if (isNull(player) || isNull(player.world) || isNull(e.block) || isNull(e.block.definition)) return;
  if (!isNull(player.currentItem) || !op.isPlayerOmnipotent(player)) return;
  e.newSpeed = 12.0f * e.block.definition.hardness + 1.0;
}, mods.zenutils.EventPriority.low());
