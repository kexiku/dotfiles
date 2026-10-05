# config directory
ZSH_CONFIG="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"

# theme
ZSH_THEME="waiwai"

# plugins
plugins=(
  # colored-man-pages
  # git
  # zsh-allclear
  # zsh-autosuggestions
)

# plugins configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# add functions and completions dirs to fpath
fpath=($ZSH_CONFIG/{functions,completions} $fpath)

# autoload compinit
autoload -Uz compinit

# source helpers
source "$ZSH_CONFIG/lib/helpers.zsh"

# add all plugins from the 'plugins' array to fpath
for plugin ($plugins); do
  if is_plugin "$ZSH_CONFIG" "$plugin"; then
    fpath=("$ZSH_CONFIG/plugins/$plugin" $fpath)
  else
    echo "[zsh] Plugin '$plugin' not found."
  fi
done
unset plugin

# define zcompdump
$ZCOMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"

# run compinit
if [[ -n $ZCOMPDUMP(#qN.mh+24) ]]; then
  # full check and rebuild if a previous dump is older than a day
  compinit -d "$ZCOMPDUMP"
else
  # skip the check otherwise
  compinit -C
fi

# load plugins
for plugin ($plugins); do
  source "$ZSH_CONFIG/plugins/$plugin/$plugin.plugin.zsh"
done
unset plugin

# load theme
if [[ -n "$ZSH_THEME" ]]; then
  if is_theme "$ZSH_CONFIG/themes" "$ZSH_THEME"; then
    source "$ZSH_CONFIG/themes/$ZSH_THEME.zsh-theme"
  else
    echo "[zsh] Theme '$ZSH_THEME' not found."
  fi
fi

# aliases
source "$ZSH_CONFIG/lib/aliases.zsh"

# history
source "$ZSH_CONFIG/lib/history.zsh"

# navigation
source "$ZSH_CONFIG/lib/navigation.zsh"

# streams
setopt multios # enable redirect to multiple streams: echo >file1 >file2

# enable zsh-syntax-highlighting plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# disable path underlining
ZSH_HIGHLIGHT_STYLES[path]='none'
