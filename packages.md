```bash
$ sudo pacman -S \
    # Install Guide
    networkmanager neovim grub efibootmgr sudo git go \
    # Security
    pass ufw polkit polkit-kde-agent \
    # Multimedia
    alsa-utils pulseaudio pulseaudio-alsa pamixer \
    # Input Method
    noto-fonts-cjk fcitx5-im fcitx5-mozc \
    # CLI
    zsh starship \
    # Terminal
    alacritty ttf-hack-nerd \
    # Backlight
    brightnessctl \
    # Wayland utilities
    swayidle nwg-bar \
    # File Manager
    thunar gvfs \
    # Status Bar
    waybar otf-font-awesome \
    # Development

$ yay -S  \
    # Hyprland
    gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm \
    # Wayland utilities
    swaylock-effects-git

# Hyprland
$ git clone --recursive https://github.com/hyprwm/Hyprland
$ cd Hyprland
$ make all && sudo make install

# Zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
