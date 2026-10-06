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

# avoid duplicated entries in fpath
typeset -U fpath

# add functions & completions to fpath
fpath=("$ZSH_CONFIG"/{functions,completions} $fpath)

# add plugins to fpath
source "$ZSH_CONFIG/helpers/plugin.helper.zsh"

for plugin ($plugins); do
  if is_plugin "$ZSH_CONFIG" "$plugin"; then
    fpath=("$ZSH_CONFIG/plugins/$plugin" $fpath)
  else
    print -u2 "[zsh] Plugin '$plugin' not found."
  fi
done
unset plugin

# load functions
func_file=("$ZSH_CONFIG"/functions/*(N-.:t)) # match null glob, regular files and symlinks to them
(( $#func_file )) && autoload -Uz $func_file # if array is not empty, autoload functions
unset func_file

# create cache dir if missing
mkdir -p "$ZSH_CACHE"

# define zcompdump
ZCOMPDUMP="$ZSH_CACHE/.zcompdump"

# load compinit
autoload -Uz compinit

# run compinit
if [[ ! -f $ZCOMPDUMP || -n $ZCOMPDUMP(#qN.mh+24) ]]; then
  # full check if a previous dump is older than a day
  compinit -d "$ZCOMPDUMP"
else
  # skip the checks otherwise
  compinit -C -d "$ZCOMPDUMP"
fi

# load lib files
for lib_file ("$ZSH_CONFIG"/lib/*.zsh); do
  source "$lib_file"
done
unset lib_file

# load plugins
for plugin ($plugins); do
  is_plugin "$ZSH_CONFIG" "$plugin" \
    && source "$ZSH_CONFIG/plugins/$plugin/$plugin.plugin.zsh"
done
unset plugin

# load aliases
for alias_file ("$ZSH_CONFIG"/aliases/*.zsh); do
  source "$alias_file"
done
unset alias_file

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
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
