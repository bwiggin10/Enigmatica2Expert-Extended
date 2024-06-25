#modloaded loottweaker

import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Functions;
import loottweaker.vanilla.loot.Conditions;

#priority 10

// Remove old drop and add new
function tweak(
  table as string,
  poolStr as string,
  entryToRemove as string,
  itemToRemove as IItemStack,
  itemsToAdd as IItemStack[],
  minMax as int[],
  isByPlayer as bool = false,
  poolWeight as int = 1
) {
  // Current pool
  var pool = loottweaker.LootTweaker.getTable(table).getPool(poolStr);

  // Remove old drops if specified
  if (!isNull(entryToRemove))
    pool.removeEntry(entryToRemove);

  // Add new drops
  if (!isNull(itemsToAdd)) {
    for itemToAdd in itemsToAdd {
      val smelted = utils.smelt(itemToAdd);
      if (!isNull(smelted)) {
        // Add with smelting function (if smelted item exist)
        pool.addItemEntry(itemToAdd, poolWeight, 0, [
          Functions.parse({
            'function': 'minecraft:furnace_smelt',
            conditions: [
              {
                properties: { 'minecraft:on_fire': true },
                entity: 'this',
                condition: 'minecraft:entity_properties',
              },
            ],
          }),
          Functions.setCount(minMax[0], minMax[1]),
          Functions.lootingEnchantBonus(0, 1, 0),
        ], isByPlayer ? [Conditions.killedByPlayer()] : []);
      }
      else {
        // Add non-smelt function
        pool.addItemEntryHelper(itemToAdd, poolWeight, 0, [
          Functions.setCount(minMax[0], minMax[1]),
          Functions.lootingEnchantBonus(0, 1, 0),
        ], isByPlayer ? [Conditions.killedByPlayer()] : []);
      }
    }
  }

  // Remove old item from JEI and crafts
  // usually need when unify meat
  if (!isNull(itemToRemove)) {
    Purge(utils.smelt(itemToRemove)).furn();
    Purge(itemToRemove);
  }
}
