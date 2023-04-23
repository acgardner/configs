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

# fzf
brew install fzf

# bat
brew install bat

# lazygit
brew install jesseduffield/lazygit/lazygit

# ripgrep
brew install ripgrep

# lsd
brew install lsd

# nerd fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-fonts

#==================================================
# move files around
#==================================================
echo -e "Moving init.lua...\n"
mv ./nvim/init.lua $HOME/.config/nvim/init.lua

echo -e "Moving .zshrc...\n"
mv ./.zshrc $HOME/.zshrc

