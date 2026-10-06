# theme
ZSH_THEME="waiwai"

# plugins
plugins=(
  colored-man-pages
  zsh-allclear
  zsh-autosuggestions
)

# plugins configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# load compinit
autoload -Uz compinit

# add completions to fpath
fpath=("$ZSH_CONFIG/completions" $fpath)

# add all plugins from the 'plugins' array to fpath
source "$ZSH_CONFIG/helpers/plugin.helper.zsh"

for plugin ($plugins); do
  if is_plugin "$ZSH_CONFIG" "$plugin"; then
    fpath=("$ZSH_CONFIG/plugins/$plugin" $fpath)
  else
    print -u2 "[zsh] Plugin '$plugin' not found."
  fi
done
unset plugin

# create cache dir if missing
mkdir -p "$ZSH_CACHE"

# define zcompdump
ZCOMPDUMP="$ZSH_CACHE/.zcompdump"

# run compinit
if [[ -n $ZCOMPDUMP(#qN.mh+24) ]]; then
  # full check if a previous dump is older than a day
  compinit -d "$ZCOMPDUMP"
else
  # skip the check otherwise
  compinit -C
fi

# load functions
for functions ("$ZSH_CONFIG"/functions/*.zsh); do
  source "$functions"
done
unset functions

# load plugins
for plugin ($plugins); do
  is_plugin "$ZSH_CONFIG" "$plugin"
    && source "$ZSH_CONFIG/plugins/$plugin/$plugin.plugin.zsh"
done
unset plugin

# load lib files
for lib_file ("$ZSH_CONFIG"/lib/*.zsh); do
  source "$lib_file"
done
unset lib_file

# load theme
source "$ZSH_CONFIG/helpers/theme.helper.zsh"

if [[ -n "$ZSH_THEME" ]]; then
  if is_theme "$ZSH_CONFIG/themes" "$ZSH_THEME"; then
    source "$ZSH_CONFIG/themes/$ZSH_THEME.zsh-theme"
  else
    print -u2 "[zsh] Theme '$ZSH_THEME' not found."
  fi
fi

# load zsh-syntax-highlighting plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# disable path underlining
ZSH_HIGHLIGHT_STYLES[path]='none'
