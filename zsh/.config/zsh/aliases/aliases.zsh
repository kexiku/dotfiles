# moving up
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# directory stack
alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# list contents
alias ls='ls --color=tty --group-directories-first'
alias l='ls -lAFh'
alias la='ls -lAFh'
alias lsa='ls -laFh'
alias ll='ls -lFh'

# ask before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# directories
alias md='mkdir -p'
alias rd='rmdir'

# history
alias h='history'
alias hl='history | less'
alias hs='history | grep'
alias hsi='history | grep -i'

# clear
alias c='clear'
alias cl='clear'

# check zsh startup time
alias timezsh='for i in $(seq 1 10); do time zsh -i -c exit; done'

# other aliases
alias grep='grep --color'

alias df='df -h'
