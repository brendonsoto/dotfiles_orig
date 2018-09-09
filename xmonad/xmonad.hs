import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ desktopConfig
        { terminal = "alacritty"
        , borderWidth = 2
        , focusedBorderColor = "#83a598"
        , normalBorderColor = "#282828"
        , manageHook = manageDocks <+> manageHook desktopConfig
        , layoutHook = smartBorders . avoidStruts $ layoutHook desktopConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#83a598" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeysP` myKeys
        

myKeys = [ ("M-p", spawn "dmenu_run")
         , ("M-<F10>", spawn "pulseaudio-ctl mute")
         , ("M-<F11>", spawn "pulseaudio-ctl down")
         , ("M-<F12>", spawn "pulseaudio-ctl up")
         , ("M-<F1>", spawn "light -U 5")
         , ("M-<F2>", spawn "light -A 5")
         ]
