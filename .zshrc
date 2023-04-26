COLOR="\e[1;36m"
RC="\033[0m"

echo "\n${COLOR}👋 Welcome Anthony!${RC}\n"

#=============================================================
# update environment variables      
#=============================================================
# export bin directories
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add local bin directory
export PATH="$PATH:$HOME/.local/bin"

# add tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

# add vs code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# export oh-my-zsh directory
export ZSH="$HOME/.oh-my-zsh"

# update editor
export EDITOR="/usr/local/bin/nvim"

#=============================================================
# initialize packages
#=============================================================
# tmuxifier
eval "$(tmuxifier init -)"

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
# git
alias gst="git status"
alias gps="git push"
alias gpl="git pull"
alias gcm="git cm"

# lazygit
alias lg="lazygit"

# ls
alias ls="colorls"
alias l="colorls -l"
alias la="colorls -a"
alias lla="colorls -la"
alias lt="colorls --tree"

# neovim
alias nv="nvim"

# python
alias p3="python3"

# tmux
alias te="tmuxifier edit-session"
alias tl="tmuxifier load-session"
alias tn="tmuxifier new-session"
