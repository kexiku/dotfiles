# XDG base directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# zsh config directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# other zsh variables
export ZSH="$HOME/.zsh"
export ZCACHE="$XDG_CACHE_HOME/zsh"
export ZSTATE="$XDG_STATE_HOME/zsh"
