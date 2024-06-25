
#priority 3900
#reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

zenClass CPurge {
  val ingr as IIngredient;

	zenConstructor() { }

	function purge(_ingr as IIngredient) as CPurge {
    ingr = _ingr;
    if (isNull(ingr)) return this;

    for item in ingr.items {
      val actItem = actualItem(item);
      recipes.remove(actItem);
      utils.log('purged:', actItem.commandString, actItem.displayName);
    }
    return this;
  }
  
  function furn() as CPurge {
    if (isNull(ingr)) return this;
    for item in ingr.items {
      furnace.remove(actualItem(item));
    }
    return this;
  }
  
  function fuel() as CPurge {
    if (isNull(ingr)) return this;
    for item in ingr.items {
      furnace.setFuel(actualItem(item), 0);
    }
    return this;
  }

  function ores() as CPurge {
    if (isNull(ingr)) return this;
    for item in ingr.items {
      if (utils.DEBUG) logger.logWarning('Low performance getter: '~item.commandString~'.ores');
      for ore in item.ores {
        ore.remove(item);
        utils.log('Purged ore: ' ~ ore.name ~ ' from: ' ~ item.commandString);
      }
    }
    return this;
  }

  function ores(list as IOreDictEntry[]) as CPurge {
    if (isNull(ingr)) return this;
    for item in ingr.items {
      for ore in list {
        ore.remove(item);
      }
    }
    return this;
  }

  ///////////// Private field /////////////
  function actualItem(item as IItemStack) as IItemStack {
    return (item.damage == 0 && item.isDamageable)
      ? item.anyDamage()
      : item;
  }

}

static purge as CPurge = CPurge();

global Purge as function(IIngredient)CPurge = function(ingr as IIngredient) as CPurge {
  return purge.purge(ingr);
};
