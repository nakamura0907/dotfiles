#!/bin/bash

# パッケージのインストール
echo ""
echo "========================================"
echo "Installing packages..."
echo "========================================"
echo ""

sudo pacman -S --needed \
    alacritty \
    git \
    neovim \
    polybar nm-connection-editor pcmanfm pacman-contrib \
    xmonad xmonad-contrib \
    
yay -S --needed visual-studio-code-bin
