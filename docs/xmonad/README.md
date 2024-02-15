# XMonad

## How to get WM_CLASS

```bash
$ xprop | grep WM_CLASS
# click on the window
# WM_CLASS(STRING) = "google-chrome", "Google-chrome"
```

```haskell
myManageHook :: ManageHook
myManageHook = composeAll
    [ 
      -- second string is the WM_CLASS
      className =? "Google-chrome" --> doFloat
    ]
```