import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Layout.Spacing

------------------------
-- Terminal
------------------------

myTerminal :: String
myTerminal = "alacritty"

------------------------
-- layoutHook
------------------------

myLayoutHook = avoidStruts $ spacing 2 $ layoutHook def

------------------------
-- ManageHook
------------------------

myManageHook :: ManageHook
myManageHook = composeAll
    [ 
      className =? "Stalonetray" --> doFloat,
      className =? "zoom" --> doFloat
    ]

------------------------
-- modMask
------------------------

myModMask :: KeyMask
myModMask = mod4Mask

------------------------
-- startupHook
------------------------

myStartupHook :: X ()
myStartupHook = spawnOnce "~/.config/polybar/launch.sh &"

------------------------
-- Key bindings
------------------------

myKeys =
  [ 
    ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
    ("M1-S-l", spawn "i3lock-fancy")
  ]

------------------------
-- Main
------------------------

main :: IO ()
main =
  xmonad $
    ewmh $
      docks $
        def
          { 
            terminal = myTerminal,
            layoutHook = myLayoutHook,
            manageHook = myManageHook <+> manageHook def,
            modMask = myModMask,
            startupHook = myStartupHook
          }
          `additionalKeysP` myKeys

