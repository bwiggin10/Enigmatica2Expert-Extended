#modloaded zenutils
#priority 3000
#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.AttributeModifier;

function setAttribute(player as IPlayer, id as string, uuid as string, value as double) as void {
  val attribute = player.getAttribute(id);
  var modifier = attribute.getModifier(uuid);
  if (isNull(modifier))
    attribute.applyModifier(AttributeModifier.createModifier('Omnipotence', value, 0, uuid));
}

function remAttribute(player as IPlayer, id as string, uuid as string) as void {
  val attribute = player.getAttribute(id);
  attribute.removeModifier(uuid);
}
