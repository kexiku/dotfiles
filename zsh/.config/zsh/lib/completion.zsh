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

# use caching to use completions for commands like apt and dpkg
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$ZSH_CACHE/zcompcache"

# set colors for kill process list
zstyle ':completion:*' list-colors '' # unset all colors first
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# set completion colors to be the same as 'ls'
[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ...unless we really want to.
zstyle '*' single-ignored show

# bind Shift+Tab to reverse menu completion
bindkey -M menuselect '^[[Z' reverse-menu-complete

# autoload bash completion functions
autoload -U +X bashcompinit && bashcompinit
