import           XMonad
import           XMonad.Config.Desktop (desktopConfig)
import           XMonad.Util.EZConfig

myTerminal = "alacritty -e tmux"

myModMask = mod4Mask

myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#657b83"

myWorkspaces = ["one", "two", "three", "four", "five"]

myRemoveKeys = [ (myModMask .|. shiftMask, xK_q) -- leaving xmonad in lxqt is annoying
               ]

myAdditionalKeys = [ ((myModMask .|. shiftMask, xK_l), spawn "lxqt-leave --lockscreen")
                   , ((myModMask .|. shiftMask, xK_q), spawn "lxqt-leave --logout")
                   , ((myModMask .|. shiftMask, xK_p), spawn "rofi -show drun")
                   ]

defaults = desktopConfig { terminal           = myTerminal
                         , modMask            = myModMask
                         , normalBorderColor  = myNormalBorderColor
                         , focusedBorderColor = myFocusedBorderColor
                         , workspaces         = myWorkspaces
                         } `removeKeys` myRemoveKeys `additionalKeys` myAdditionalKeys

main = xmonad defaults
