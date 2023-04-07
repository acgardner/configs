BBLUE="\e[1;34m"

echo "\n${BBLUE}Welcome Anthony! Try not to waste too many epochs :)\n"

# =====================
# EXPORTS          
# =====================
# Export path to command line executables
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Export path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Export path to VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ====================
# ZSH SETTINGS
# ====================
# Define terminal theme
ZSH_THEME="robbyrussell"

# Notify when an update is available
zstyle ':omz:update' mode reminder

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Configure plugins
plugins=(git)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh
