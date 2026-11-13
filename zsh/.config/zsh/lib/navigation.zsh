# Add hooks to trigger on cd
autoload -Uz add-zsh-hook
add-zsh-hook chpwd clear
add-zsh-hook chpwd _overview

# Options
setopt auto_cd           # omit cd when entering a directory
setopt auto_pushd        # build directory stack
setopt pushd_ignore_dups # prevent directory stack from duplicate entries
setopt pushdminus        # reverse directory stack navigation
