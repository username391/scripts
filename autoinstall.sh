#!/bin/bash

# Установка плагинов для nnn
if [ -d "$HOME/.config/nnn/plugins" ]; then
	echo "NNN plugins folder already exists. Delete it to reinstall"
else
	sh  -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
fi

# Установка oh-my-zsh
# if [ -d "$HOME/.oh-my-zsh" ]; then
# 	echo "Oh My Zsh is already installed"
# else
# 	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi


# zsh-autosuggestions install
if [ -d "$HOME/.zsh/zsh-autosuggestions" ]; then
	echo "AutoSuggestions plugin already installed"
else
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# Установка dirhistory
if [ -d "$HOME/.zsh/zsh-dirhistory" ]; then
	echo "DirHistory plugin already installed"
else
	mkdir "$HOME/.zsh/zsh-dirhistory"
	curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/dirhistory/dirhistory.plugin.zsh" > "$HOME/.zsh/zsh-dirhistory/dirhistory.plugin.zsh"
	chmod "+x" "$HOME/.zsh/zsh-dirhistory/dirhistory.plugin.zsh"
fi

# Установка json-tools
if [ -d "$HOME/.zsh/zsh-json-tools" ]; then
	echo "JsonTools plugin already installed"
else
	mkdir "$HOME/.zsh/zsh-json-tools"
	curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/jsontools/jsontools.plugin.zsh" > "$HOME/.zsh/zsh-json-tools/jsontools.plugin.zsh"
	chmod "+x" "$HOME/.zsh/zsh-json-tools/jsontools.plugin.zsh"
fi

# Установка темы p10k
if [ -d "$HOME/.zsh/themes/powerlevel10k" ]; then
	echo "P10K theme already installed"
else
	git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/themes/powerlevel10k"
fi


