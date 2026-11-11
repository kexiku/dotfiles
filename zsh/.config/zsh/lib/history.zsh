# set history file properties
HISTFILE="$ZSTATE/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history         # append history to HISTFILE on session exit
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_ignore_dups       # ignore consecutive duplicate commands
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_verify            # prevent immediate execution when using history expansion
