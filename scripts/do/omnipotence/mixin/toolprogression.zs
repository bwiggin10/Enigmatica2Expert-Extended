#loader mixin
#modloaded zenutils scalinghealth toolprogression

import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.entity.player.EntityPlayer;
import mixin.CallbackInfoReturnable;
import native.net.silentchaos512.scalinghealth.utils.SHPlayerDataHandler;
import native.net.minecraftforge.common.util.FakePlayer;

#mixin {targets: "tyra314.toolprogression.harvest.HarvestHelper"}
zenClass MixinBlockOmnipotence {
    #mixin Static
    #mixin Inject {method: "canPlayerHarvestBlock", at: {value: "HEAD"}, cancellable: true}
    function omnipotentMineEverything(player as EntityPlayer, state as IBlockState, cir as CallbackInfoReturnable) as void {
        if (isNull(player) || player instanceof FakePlayer) return;
        if (SHPlayerDataHandler.get(player).difficulty >= 1000.0) cir.setReturnValue(true);
    }
}
