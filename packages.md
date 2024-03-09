```bash
$ sudo pacman -S \
    # Install Guide
    networkmanager neovim grub efibootmgr sudo git go \
    # Security
    pass ufw \
    # Multimedia
    alsa-utils pulseaudio pulseaudio-alsa pamixer \
    # Input Method
    noto-fonts-cjk fcitx5-im fcitx5-mozc \
    # CLI
    zsh starship \
    # Terminal
    alacritty ttf-dejavu \
    # Backlight
    brightnessctl \
    # Wayland utilities
    swayidle

$ yay -S  \
    # Hyprland
    gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm \
    # Wayland utilities
    swaylock-effects-git

$ git clone --recursive https://github.com/hyprwm/Hyprland
$ cd Hyprland
$ make all && sudo make install

# Oh My Zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
