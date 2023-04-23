BBLUE="\e[1;34m"
RESET="\033[0m"

echo "\n${BBLUE}     Welcome Anthony! What are we working on today?${RESET}\n"

# ============================================================
# configure aliases
# ============================================================
# ls
# alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# git
alias gst='git status'
alias gps='git push'
alias gpl='git pull'

# python
alias p3='python3'

# ============================================================
# configure paths          
# ============================================================

# export path to bin directories
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add path to local bin directory
export PATH="$PATH:$HOME/.local/bin"

# add path to vs code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# add path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# ============================================================
# configure zoxide
# ============================================================

eval "$(zoxide init zsh)"

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

# source zsh-autocomplete
source $HOME/.zsh-autocomplete/zsh-autocomplete.plugin.zsh  

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh
