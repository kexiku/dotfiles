# path
export PATH=$HOME/bin:$HOME/.local/bin:/usr/games:$PATH

# zsh variables
export ZSH="$HOME/.zsh"
export ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export ZSH_CONFIG="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi
