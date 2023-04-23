# !/usr/bin/env bash

# run this script to configure a linux operating system

#==================================================
# update package manager
#==================================================
sudo apt update && sudo apt upgrade -y

#==================================================
# install packages
#==================================================
# zsh
sudo apt install zsh -y

# zsh-autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.zsh-autocomplete

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# fzf
sudo apt install fzf -y

# nerd fonts
mkdir -p $HOME/.local/share/fonts

if [ $PWD != $HOME/.local/share/fonts ]; then
    cd $HOME/.local/share/fonts;
    curl -fLo "Symbols-2048-em Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/NerdFontsSymbolOnly/complete/Symbols-2048-em%20Nerd%20Font%20Complete.ttf;
fi

#==================================================
# move files around
#==================================================
if [ $PWD != $HOME ]; then
    cd $HOME;
    mv $HOME/config/nvim/init.lua $HOME/.config/nvim/init.lua;
    mv $HOME/config/.zshrc $HOME/.zshrc;
fi
