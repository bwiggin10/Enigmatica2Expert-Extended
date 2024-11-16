#modloaded thaumicwonders
#loader mixin

import native.com.verdantartifice.thaumicwonders.common.blocks.base.BlockDeviceTW;
import native.com.verdantartifice.thaumicwonders.common.network.PacketHandler;
import native.com.verdantartifice.thaumicwonders.common.network.packets.PacketMeatyOrbAction;
import native.com.verdantartifice.thaumicwonders.common.tiles.devices.TileMeatyOrb;
import native.net.minecraft.block.Block;
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.enchantment.Enchantment;
import native.net.minecraft.enchantment.EnchantmentDurability;
import native.net.minecraft.enchantment.EnchantmentHelper;
import native.net.minecraft.enchantment.EnchantmentMending;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.util.EnumFacing;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.util.NonNullList;
import native.net.minecraft.world.IBlockAccess;
import native.net.minecraft.world.World;
import native.net.minecraftforge.oredict.OreDictionary;

#mixin Mixin
#{targets: "com.verdantartifice.thaumicwonders.common.blocks.devices.BlockMeatyOrb"}
zenClass MixinBlockMeatyOrb extends BlockDeviceTW {

  // Add redstone control (func_189540_a => neighborChanged)
  function func_189540_a(state as IBlockState, world as World, pos as BlockPos, blockIn as Block, fromPos as BlockPos) as void {
    // super.neighborChanged(state, world, pos, blockIn, fromPos);
    if (world.isRemote) return;

    val tile = world.getTileEntity(pos);
    if (isNull(tile) || !(tile instanceof TileMeatyOrb)) return;

    if (world.getRedstonePowerFromNeighbors(pos) > 0) {
      PacketHandler.INSTANCE.sendToServer(PacketMeatyOrbAction(pos));
    }
  }

  // Make redstone stick to the block
  function canConnectRedstone(state as IBlockState, world as IBlockAccess, connectFrom as BlockPos, side as EnumFacing) as bool{
    return side != EnumFacing.UP && side != EnumFacing.DOWN;
  }
}

#mixin Mixin
#{targets: "com.verdantartifice.thaumicwonders.common.tiles.devices.TileMeatyOrb"}
zenClass MixinTileMeatyOrb {

  #mixin Redirect
  #{
  #  method: "func_73660_a",
  #  at: {
  #    value: "INVOKE",
  #    target: "Lnet/minecraft/item/ItemStack;func_77946_l()Lnet/minecraft/item/ItemStack;"
  #  }
  #}
  function replaceMeatDrop(item as ItemStack) as ItemStack {
    val list as NonNullList = OreDictionary.getOres('listAllmeatraw', false);
    val size = list.size();
    if (size <= 0) return item.copy();
    val entry = size != 1
      ? list.get(this0.world.rand.nextInt(size)) as ItemStack
      : list.get(0);
    return entry.copy();
  }
}

#mixin Mixin
#{targets: "com.verdantartifice.thaumicwonders.common.items.catalysts.ItemAlchemistStone"}
zenClass MixinItemAlchemistStone {

  // PLACEHOLDER: Repearable injection
  // There should be injection of code that making this stone repearable. Not implemented but must be here due refactoring.

  // Make stone enchantable with Unbreaking and Mending
  #mixin Overwrite
  function isBookEnchantable(stack as ItemStack, book as ItemStack) as bool {
    for k in EnchantmentHelper.getEnchantments(book).keySet
      if (canApplyAtEnchantingTable(stack, k)) return true;
    return false;
  }

  function canApplyAtEnchantingTable(thisStack as ItemStack, enchantment as Enchantment) as bool {
    return enchantment instanceof EnchantmentDurability || enchantment instanceof EnchantmentMending;
  }

  // getItemEnchantability
  #mixin Overwrite
  function func_77619_b() as int {
    return 1;
  }

  // Convert output to clusters
  #mixin Overwrite
  function getRefiningResult(input as ItemStack) as ItemStack {
    if (isNull(input) || input.isEmpty()) return null;

    val ids = OreDictionary.getOreIDs(input);
    for oreID in ids {
      val newName = OreDictionary.getOreName(oreID);
      if (isNull(newName) || !newName.startsWith("ore")) continue;
      val clusterName = "cluster" + newName.substring(3);
      val item = scripts.mixin.utils.firstItem(clusterName);
      if (!isNull(item)) return item;
    }
    return null;
  }
}

#mixin Mixin
#{targets: "com.verdantartifice.thaumicwonders.common.items.catalysts.ItemAlienistStone"}
zenClass MixinItemAlienistStone {

  // PLACEHOLDER: Repearable injection
  // There should be injection of code that making this stone repearable. Not implemented but must be here due refactoring.

  // Make stone enchantable with Unbreaking and Mending
  #mixin Overwrite
  function isBookEnchantable(stack as ItemStack, book as ItemStack) as bool {
    for k in EnchantmentHelper.getEnchantments(book).keySet
      if (canApplyAtEnchantingTable(stack, k)) return true;
    return false;
  }

  function canApplyAtEnchantingTable(thisStack as ItemStack, enchantment as Enchantment) as bool {
    return enchantment instanceof EnchantmentDurability || enchantment instanceof EnchantmentMending;
  }

  // getItemEnchantability
  #mixin Overwrite
  function func_77619_b() as int {
    return 1;
  }

  // Convert output to clusters
  #mixin Overwrite
  function getRefiningResult(input as ItemStack) as ItemStack {
    if (isNull(input) || input.isEmpty()) return null;

    val ids = OreDictionary.getOreIDs(input);
    for oreID in ids {
      val newName = OreDictionary.getOreName(oreID);
      if (isNull(newName) || !newName.startsWith("cluster")) continue;
      val clusterName = "crystalShard" + newName.substring(7);
      val item = scripts.mixin.utils.firstItem(clusterName);
      if (!isNull(item)) return item;
    }
    return null;
  }
}

#mixin Mixin
#{targets: "com.verdantartifice.thaumicwonders.common.items.catalysts.ItemTransmuterStone"}
zenClass MixinItemTransmuterStone {

  // PLACEHOLDER: Repearable injection
  // There should be injection of code that making this stone repearable. Not implemented but must be here due refactoring.

  // Make stone enchantable with Unbreaking and Mending
  #mixin Overwrite
  function isBookEnchantable(stack as ItemStack, book as ItemStack) as bool {
    for k in EnchantmentHelper.getEnchantments(book).keySet
      if (canApplyAtEnchantingTable(stack, k)) return true;
    return false;
  }

  function canApplyAtEnchantingTable(thisStack as ItemStack, enchantment as Enchantment) as bool {
    return enchantment instanceof EnchantmentDurability || enchantment instanceof EnchantmentMending;
  }

  // getItemEnchantability
  #mixin Overwrite
  function func_77619_b() as int {
    return 1;
  }

  // Convert output to clusters
  #mixin Overwrite
  function getRefiningResult(input as ItemStack) as ItemStack {
    if (isNull(input) || input.isEmpty()) return null;
    // print('~~ enter getRefiningResult');

    val ids = OreDictionary.getOreIDs(input);
    for oreID in ids {
      // print('     oreID: '~oreID);
      val inputOre = OreDictionary.getOreName(oreID);
      if (isNull(inputOre)) continue;
      // print('     inputOre: '~inputOre);

      for orePrefix in scripts.mods.thaumicwonders.transmuterStone.orePrefixes {
        // print('       orePrefix: '~orePrefix);
        if (!inputOre.startsWith(orePrefix)) continue;

        val inputBase = inputOre.substring(orePrefix.length);
        val refiningResults = scripts.mods.thaumicwonders.transmuterStone.refiningResults;
        // print('       inputBase: "'~inputBase~'"');
        for i in 0 .. refiningResults.length / 2 {
          val k = i * 2;
          val norm = refiningResults[k];
          val invr = refiningResults[k + 1];
          // print('         k:'~k~' norm: '~norm~' invr: '~invr);
          if (norm != inputBase && invr != inputBase) continue;

          val resultOreBase = invr == inputBase ? norm : invr;
          val list as NonNullList = OreDictionary.getOres(orePrefix + resultOreBase);
          // print('         resultOreBase: '~resultOreBase~' list.size(): '~list.size());
          if (list.size() <= 0) continue;

          val item = list.get(0) as ItemStack;
          // print('         item: '~toString(item));
          if (!isNull(item)) return item;
        }
      }
    }
    return null;
  }
}
