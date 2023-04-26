COLOR="\e[1;36m"
RC="\033[0m"

echo "\n${COLOR}Welcome Anthony! What are we working on today?${RC}\n"

#=============================================================
# configure paths          
#=============================================================

# export path to bin directories
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add path to local bin directory
export PATH="$PATH:$HOME/.local/bin"

# add path to vs code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# add path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

#=============================================================
# initialize packages
#=============================================================

# zoxide
eval "$(zoxide init zsh)"

#=============================================================
# configure zsh
#=============================================================

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

#=============================================================
# configure aliases
#=============================================================
# ls
alias ls="colorls"
alias l="colorls -l"
alias la="colorls -a"
alias lla="colorls -la"
alias lt="colorls --tree"

# git
alias gst="git status"
alias gps="git push"
alias gpl="git pull"
alias gcm="git cm"

# python
alias p3="python3"

# tmux
alias t="tmux"

# lazygit
alias lg="lazygit"
