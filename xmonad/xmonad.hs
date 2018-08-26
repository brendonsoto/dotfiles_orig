import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ xfceConfig
        { terminal = "urxvt"
        , manageHook = manageDocks <+> manageHook xfceConfig
        , layoutHook = avoidStruts $ layoutHook xfceConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "lightblue" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask, xK_p), spawn "dmenu_run")
        , ((0       , 0x1008FF13), spawn "pulseaudio-ctl up")
        , ((0       , 0x1008FF11), spawn "pulseaudio-ctl down")
        , ((0       , 0x1008FF12), spawn "pulseaudio-ctl mute")
        ]