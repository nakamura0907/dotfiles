#!/bin/bash

# readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# readonly PROJECT_ROOT="$(realpath "$SCRIPT_DIR/../../")"

readonly DOTFILES_DIR="$HOME/.dotfiles"

# パッケージのインストール
echo "パッケージ リストのアップデートを行います"
sudo apt update -y

echo "パッケージをインストールします"
sudo apt install -y \
	git \
	zsh zsh-autosuggestions zsh-syntax-highlighting 

if [ ! -d "/opt/nvim-linux64" ]; then
	echo "NeoVimをインストールします"
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	rm nvim-linux64.tar.gz
else
	echo "NeoVimはすでにインストール済みです"
fi

if command -v starship >/dev/null 2>&1; then
	echo "Starshipはすでにインストール済みです"
else
	echo "Starshipをインストールします"
	curl -sS https://starship.rs/install.sh | sh
fi

# dotfilesのクローン
if [ ! -d "$DOTFILES_DIR" ]; then
	echo "dotfilesリポジトリをクローンします"
	git clone https://github.com/nakamura0907/dotfiles.git "$DOTFILES_DIR"
else
	echo "dotfilesリポジトリはすでに存在しています"
	git -C "$DOTFILES_DIR" pull origin main
fi

# シンボリックリンクを貼る
echo "シンボリックリンクを貼ります"

if [ ! -d "$HOME/.config" ]; then
	echo "$HOME/.configディレクトリを作成します"
	mkdir -p "$HOME/.config"
fi

ln -snfv "$DOTFILES_DIR/.zshrc" "$HOME/"
ln -snfv "$DOTFILES_DIR/.config/git" "$HOME/.config/"
ln -snfv "$DOTFILES_DIR/.config/nvim" "$HOME/.config/"
ln -snfv "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/"

# Oh My Zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zshをインストールします"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zshはすでにインストールされています。"
fi

# デフォルトシェルの変更
if [ "$(basename "$SHELL")" != "zsh" ]; then
	echo "Zshをデフォルトシェルに変更します"
	chsh -s "$(which zsh)"
else
	echo "すでにZshがデフォルトシェルです"
fi

# 開発者ツールのインストール
if command -v kubectl >/dev/null 2>&1; then
    echo "kubectlはすでにインストール済みです"
else
    echo "kubectlをインストールします"

    sudo apt-get update
    sudo apt-get install -y \
        apt-transport-https ca-certificates gnupg

    if [ ! -d "/etc/apt/keyrings" ]; then
        echo "/etc/apt/keyringsディレクトリを作成します"
        sudo mkdir -p -m 755 /etc/apt/keyrings
    fi

    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg

    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list

    sudo apt-get update
    sudo apt-get install -y kubectl
fi

