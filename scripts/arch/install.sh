#!/bin/bash

echo ""
echo "========================================"
echo "Installing packages..."
echo "========================================"
echo ""

sudo pacman -S --needed \
    alacritty \
    neovim \
    polybar nm-connection-editor pcmanfm pacman-contrib \
    picom \
    xmonad xmonad-contrib dmenu \
    git \
    zsh \
    
yay -S --needed visual-studio-code-bin
