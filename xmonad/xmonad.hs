import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeysP)
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
        } `additionalKeysP` myKeys
        

myKeys = [ ("M-p", spawn "dmenu_run")
         , ("M-<F10>", spawn "pulseaudio-ctl mute")
         , ("M-<F11>", spawn "pulseaudio-ctl down")
         , ("M-<F12>", spawn "pulseaudio-ctl up")
         , ("M-<F5>", spawn "light -U 5")
         , ("M-<F6>", spawn "light -A 5")
         ]
