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

#==================================================
# move files around
#==================================================
echo -e "Moving init.lua...\n"
mv ./nvim/init.lua $HOME/.config/nvim/init.lua

echo -e "Moving .zshrc...\n"
mv ./.zshrc $HOME/.zshrc

