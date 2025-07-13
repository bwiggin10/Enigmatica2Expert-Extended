/*

It seems that due to the fact that the my_precious-1.12.2-v2hf1 has
been ported from newer versions of MC, its model initialization
code only works in vanilla 1.12.2, without some mods.
This file is one of the 3 parts of the fix that
1. Delete the old initialization method
2. Create a separate initialization
3. Correctly assign resourceLocation

Author: Krutoy242
Done for modpack 🌳 Enigmatica: 2 Expert - Extended

*/

#modloaded my_precious
#loader mixin

#mixin {targets: "com.existingeevee.my_precious.MyPrecious"}
zenClass MixinMyPrecious {
    #mixin Overwrite
    function onRegisterItem(event as native.net.minecraftforge.event.RegistryEvent.Register) as void {
        // NO-OP
    }
}
