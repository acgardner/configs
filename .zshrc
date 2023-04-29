COLOR="\e[1;36m"
RC="\033[0m"

echo "\n${COLOR}👋 Welcome Anthony!${RC}\n"

#=============================================================
# environment variables
#=============================================================
source $HOME/.config/zsh/exports.zsh

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

# zsh-autocomplete
source $HOME/.zsh-autocomplete/zsh-autocomplete.plugin.zsh  

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# zap
source $HOME/.config/zsh/zap.sh

#=============================================================
# aliases
#=============================================================
source $HOME/.config/zsh/aliases.zsh
