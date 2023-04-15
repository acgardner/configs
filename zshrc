BBLUE="\e[1;34m"
echo "\n${BBLUE}Welcome Anthony! Try not to waste too many epochs :)\n"

# ============================================================
# configure paths
# ============================================================

# export path to command line executables
export PATH=$HOME/bin:/usr/local/bin:$PATH

# export path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# export path to visual studio code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ============================================================
# configure zsh
# ============================================================

# define terminal theme
ZSH_THEME="robbyrussell"

# notify when an update is available
zstyle ':omz:update' mode reminder

# enable command auto-correction
ENABLE_CORRECTION="true"

# configure plugins
plugins=(git)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh
