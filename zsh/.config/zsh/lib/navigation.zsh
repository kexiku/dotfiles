# Clear terminal when cd into $HOME
#
# Based on zsh-allclear plugin by givensuman
# (https://github.com/givensuman/zsh-allclear)
#
function _clear_on_chpwd() {
  if [[ $PWD = $HOME ]]; then
    emulate -L zsh; clear;
  fi
}

# Add terminal clearing hook
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _clear_on_chpwd

# Options
setopt auto_cd           # omit cd when entering a directory
setopt auto_pushd        # build directory stack
setopt pushd_ignore_dups # prevent directory stack from duplicate entries
setopt pushdminus        # reverse directory stack navigation
