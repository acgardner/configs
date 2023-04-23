# !/usr/bin/env bash

# run this script to configure a mac operating system

#==================================================
# update package manager
#==================================================
brew update && brew upgrade

#==================================================
# install packages
#==================================================
# zsh-autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.zsh-autocomplete

# zoxide
brew install zoxide

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

#==================================================
# move files around
#==================================================
echo -e "Moving init.lua...\n"
mv ./nvim/init.lua $HOME/.config/nvim/init.lua

echo -e "Moving .zshrc...\n"
mv ./.zshrc $HOME/.zshrc

