#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: このシェルスクリプトはMac用です。" >&2
    exit 1
fi

echo ""
echo "========================================"
echo "シンボリックリンクの作成"
echo "========================================"
echo ""

readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly PROJECT_ROOT="$(realpath "$SCRIPT_DIR/../../")"

echo $SCRIPT_DIR
echo $PROJECT_ROOT

ln -snfv $PROJECT_ROOT/.zshrc ~/
ln -snfv $PROJECT_ROOT/.config/git ~/.config/
ln -snfv $PROJECT_ROOT/.config/nvim ~/.config/
ln -snfv $PROJECT_ROOT/.config/starship.toml ~/.config/

echo ""
echo "========================================"
echo "パッケージのインストール"
echo "========================================"
echo ""

if ! command -v brew &>/dev/null; then
    echo "Homebrewをインストールします。"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrewのインストールが完了しました。"
else 
    echo "Homebrewはインストール済みです。"
fi

# 必須パッケージのインストール
echo "必須パッケージをHomebrew経由でインストールします。"
brew install \
    git gh \
    zsh zsh-autosuggestions zsh-syntax-highlighting starship \
    neovim 

brew install --cask \
    warp \
    font-hack-nerd-font

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh インストール中。。。"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zshはすでにインストールされています。"
fi

echo ""
echo "========================================"
echo "セットアップが完了しました。"
echo "========================================"
echo ""
