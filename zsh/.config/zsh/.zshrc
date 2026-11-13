# theme
ZSH_THEME="waiwai"

# plugins
plugins=(
  colored-man-pages
  zsh-autosuggestions
)

# plugins configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# create required directories
mkdir -p "$ZSH"
mkdir -p "$ZCACHE"
mkdir -p "$ZSTATE"

# avoid duplicated entries in fpath
typeset -U fpath

# add functions & completions to fpath
fpath=("$ZDOTDIR"/{functions,completions} $fpath)

# add plugins to fpath
for plugin ($plugins); do
  if [[ -f "$ZDOTDIR/plugins/$plugin/$plugin.plugin.zsh" ]]; then
    fpath=("$ZDOTDIR/plugins/$plugin" $fpath)
  else
    print -u2 "[zsh] Plugin '$plugin' not found."
  fi
done
unset plugin

# load functions
func_files=("$ZDOTDIR"/functions/*(N-.:t))
(( $#func_files )) && autoload -Uz $func_files # if array is not empty, load functions
unset func_files

# define zcompdump
ZCOMPDUMP="$ZCACHE/.zcompdump"

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
for lib_file ("$ZDOTDIR"/lib/*.zsh); do
  source "$lib_file"
done
unset lib_file

# load plugins
for plugin ($plugins); do
  if [[ -f "$ZDOTDIR/plugins/$plugin/$plugin.plugin.zsh" ]]; then
    source "$ZDOTDIR/plugins/$plugin/$plugin.plugin.zsh"
  fi
done
unset plugin

# load theme
if [[ -n "$ZSH_THEME" ]]; then
  if [[ -f "$ZDOTDIR/themes/$ZSH_THEME.zsh-theme" ]]; then
    source "$ZDOTDIR/themes/$ZSH_THEME.zsh-theme"
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
