#!/bin/bash

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
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https ca-certificates gnupg

sudo apt install -y \
    ansible-core

# kubectl
if command -v kubectl >/dev/null 2>&1; then
    echo "kubectlはすでにインストール済みです"
else
    echo "kubectlをインストールします"

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

# Terraform
if command -v terraform >/dev/null 2>&1; then
    echo "terraformコマンドはすでにインストール済みです"
else
    echo "terraformコマンドをインストールします"

    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    
    sudo apt install -y terraform
fi

