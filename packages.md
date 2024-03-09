```bash
```

## Install Guide

https://wiki.archlinux.jp/index.php/%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%82%AC%E3%82%A4%E3%83%89

```bash
$ sudo pacman -S networkmanager neovim grub efibootmgr sudo git go
# install yay

$ sudo pacman -S noto-fonts-cjk fcitx5-im fcitx5-mozc
```

## Recommendations

### Securitty

```bash
$ sudo pacman -S pass ufw
```

## GUI

### Display Server

```bash
# $ sudo pacman -S hyprland

# $ yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus
$ yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang

$ git clone --recursive https://github.com/hyprwm/Hyprland
$ cd Hyprland
$ make all && sudo make install
```

## Multimedia

```bash
$ sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa pamixer
```

## CLI

```bash
$ sudo pacman -S zsh starship

# yay -S oh-my-zsh-git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# $ sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## App

```bash
$ sudo pacman -S alacritty ttf-dejavu

$ sudo pacman -S brightnessctl
```