#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(realpath "$SCRIPT_DIR/../../")"

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

# 設定ファイルの配置
echo ""
echo "========================================"
echo "Creating symbolic links..."
echo "========================================"
echo ""

for f in $PROJECT_ROOT/.config/*; do
    ln -snfv $f ~/.config/
done

ln -snfv $PROJECT_ROOT/.gitconfig ~/
ln -snfv $PROJECT_ROOT/.xmonad/xmonad.hs ~/.xmonad/
ln -snfv $PROJECT_ROOT/.zshrc ~/

#  終了
echo ""
echo "========================================"
echo "Installation completed!"
echo "========================================"
echo ""

