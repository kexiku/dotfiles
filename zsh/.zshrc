# Custom theme
ZSH_THEME="waiwai"

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Aliases
alias ls="ls --color=tty --group-directories-first"
alias lsa="ls -a"
alias c="clear"
alias cl="clear"
alias df="df -h"

# Plugins
plugins=(
  colored-man-pages
  git
  zsh-autosuggestions
)
# Links to plugins repositories:
# * zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions

# Plugins configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Enable zsh-allclear plugin
# (from https://github.com/givensuman/zsh-allclear)
source $ZSH_CUSTOM/plugins/zsh-allclear/zsh-allclear.plugin.zsh

# Enable zsh-syntax-highlighting plugin
# (from https://github.com/zsh-users/zsh-syntax-highlighting)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable path underlining
ZSH_HIGHLIGHT_STYLES[path]='none'
