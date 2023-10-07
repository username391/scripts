#!/bin/bash

# Установка плагинов для nnn
if [ -d "$HOME/.config/nnn/plugins" ]; then
	echo "NNN plugins folder already exists. Delete it to reinstall"
else
	sh  -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
fi

# Установка oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "Oh My Zsh is already installed"
else
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# zsh-autosuggestions install
if [ -d "$HOME/.zsh/zsh-autosuggestions" ]; then
	echo "AutoSuggestions plugin already installed"
else
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

