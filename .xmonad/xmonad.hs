import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Layout.Spacing

main :: IO ()
main =
  xmonad $
    ewmh $
      docks $
        def
          { startupHook = spawnOnce "~/.config/polybar/launch.sh &",
            manageHook = myManageHook <+> manageHook def,
            layoutHook = avoidStruts $ spacing 2 $ layoutHook def,
            terminal = myTerminal,
            modMask = mod4Mask
          }
          `additionalKeysP` myKeys

------------------------
-- Terminal
------------------------

myTerminal = "alacritty"

------------------------
-- ManageHook
------------------------

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Stalonetray" --> doFloat,
      className =? "zoom" --> doFloat
    ]

------------------------
-- Key bindings
------------------------

myKeys =
  [ ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
    ("M1-S-l", spawn "i3lock-fancy")
  ]
