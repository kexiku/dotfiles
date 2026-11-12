# Go up
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Stack
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
alias d='dirs -v'

# User directories
alias doc='cd ~/Documents'
alias dl='cd ~/Downloads'
alias mus='cd ~/Music'
alias pic='cd ~/Pictures'
alias vid='cd ~/Videos'

# Ask before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Move to trash
alias trash='gio trash'

# df
alias df='df -h'

# diff
alias diff='diff --color'

# grep
alias grep='grep --color'

# ls
alias ls='ls --color=tty --group-directories-first'
alias l='ls -lAh'
alias la='ls -lah'
alias ll='ls -lh'

# mkdir & rmdir
alias md='mkdir -p'
alias rd='rmdir'

# rmpc
alias p='rmpc'

# viu
alias v='viu'

# Zsh functions
alias c='soft-clear'
alias cl='soft-clear'
alias h='hist'
