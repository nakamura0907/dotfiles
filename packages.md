# Install Guide

```bash
$ sudo pacman -S \
    networkmanager neovim grub efibootmgr sudo git go
```

# Internet

```bash
$ sudo pacman -S \
    keychain \
    firefox
$ yay -S  \
    google-chrome
```

# Multimedia

```bash
$ sudo pacman -S \
    alsa-utils pulseaudio pulseaudio-alsa pamixer
```

# Utilities

```bash
$ sudo pacman -S \
    zsh starship \
    alacritty ttf-hack-nerd \
    thunar gvfs \
    docker docker-compose github-cli \
    noto-fonts-cjk fcitx5-im fcitx5-mozc \
    brightnessctl
$ yay -S  \
    visual-studio-code-bin

## Oh My Zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# Document

```bash
$ sudo pacman -S \
    obsidian libreoffice-fresh
```

# Security

```bash
$ sudo pacman -S \
    pass ufw polkit polkit-kde-agent
```

# Others

```bash
$ sudo pacman -S \
    xdg-desktop-portal-hyprland \
    swayidle nwg-bar \
    waybar otf-font-awesome \
    sddm
$ yay -S  \
    # Hyprland dependencies
    gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm \
    swaylock-effects-git \
    sddm-sugar-dark

## Hyprland
$ git clone --recursive https://github.com/hyprwm/Hyprland
$ cd Hyprland
$ make all && sudo make install
```
