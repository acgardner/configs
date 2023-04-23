# !/usr/bin/env bash

# once cloned, run this script to move files to the proper locations and then remove the directory

echo -e "\nConfiguring init.lua for neovim...\n"
mv ./nvim/init.lua $HOME/.config/nvim/init.lua

echo -e "\nConfiguring .zshrc...\n"
mv ./.zshrc $HOME/.zshrc

