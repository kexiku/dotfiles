# load the completion menu module
zmodload -i zsh/complist

# prevent any non-alphanumeric characters to be treated as part of a word
# (forces word navigation to stop at each non-alphanumeric character)
WORDCHARS=''

setopt auto_menu        # show completion menu on tab press
unsetopt menu_complete  # do not autoselect the first completion entry
unsetopt flowcontrol    # prevent Ctrl+S to freeze the terminal output
setopt always_to_end    # after completing, move the cursor to the end of the word

# show selection menu on every completion
zstyle ':completion:*:*:*:*:*' menu select

# completion sensitivity
if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# show descriptions for options
zstyle ':completion:*' verbose true
zstyle ':completion:*' auto-description 'specify: %d'

# complete . and .. special directories
zstyle ':completion:*' special-dirs true

# set directories priority for cd
zstyle ':completion:*:cd:*' tag-order named-directories local-directories directory-stack path-directories

# enable caching to speed up some commands, like apt and dpkg
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$ZCACHE/zcompcache"

# set colors for kill process list
zstyle ':completion:*' list-colors '' # unset all colors first
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# set completion colors to be the same as 'ls'
[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# autoload bash completion functions
autoload -U +X bashcompinit && bashcompinit
