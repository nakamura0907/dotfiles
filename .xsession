export ZIPINFOOPT=-OCP932
export UNZIPORT=-OCP932

volumeicon &

## wallpaper
nitrogen --restore &

## IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIRS=@im=fcitx

fcitx5 &

setxkbmap jp

# Run window manager
exec xmonad