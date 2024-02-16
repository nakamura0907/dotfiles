import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Layout.Spacing

------------------------
-- General Settings
------------------------

-- The preferred terminal application. Default: "xterm"
--
myTerminal :: String
myTerminal = "alacritty"

-- the mod modifier
-- mod4Mask is the windows key
--
myModMask :: KeyMask
myModMask = mod4Mask

-- The border width
--
myBorderWidth :: Dimension
myBorderWidth = 2

------------------------
-- Keybindings
------------------------

myKeys :: [(String, X ())]
myKeys =
  [ 
    ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
    ("M-S-r", spawn "xmonad --recompile; xmonad --restart"),
    ("M1-S-l", spawn "i3lock-fancy")
  ]

------------------------
-- Layouts
------------------------

myLayoutHook = avoidStruts $ spacing 2 $ layoutHook def

------------------------
-- Window Rules
------------------------

-- ManageHook
--
-- To find the class name of a window, use `xprop | grep WM_CLASS`
-- and click on the window.
--
-- When using appName, pass the first value of WM_CLASS.
-- For className, pass the second value.
--
-- If WM_CLASS cannot be obtained, use title to match WM_NAME
--
myManageHook :: ManageHook
myManageHook = composeAll
    [
      className =? "Stalonetray" --> doFloat,
      className =? "zoom" --> doFloat,
      -- Brave-browser Picture in Picture
      title =? "ピクチャー イン ピクチャー" --> doFloat
    ]



------------------------
-- Startup Hook
------------------------

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "~/.config/polybar/launch.sh &"
  spawnOnce "picom --vsync -b"

------------------------
-- Run XMonad
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
            borderWidth = myBorderWidth,
            startupHook = myStartupHook
          }
          `additionalKeysP` myKeys

