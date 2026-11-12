# Clear terminal
_clear() {
  emulate -L zsh
  soft-clear 2> /dev/null || clear
}

# Get a directory overview
_overview() {
  emulate -L zsh
  [[ $PWD == $HOME ]] && return 0

  local -a entries=( *(DN/) *(DN^/) ) # Directories first, no error if empty
  local -i total=${#entries}

  (( total )) || return 0

  _dir_header $total

  local -i shown=$(( total < 10 ? total : 10 ))
  local -i remaining=$(( total - shown ))

  command ls -ldhU --color=always -- ${entries[1,shown]}

  if (( remaining > 0 )); then
    print -P "%F{8}%{\e[3m%}...${remaining} more%{\e[0m%}%f"
  fi
}

# Add hooks to trigger on cd
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _clear
add-zsh-hook chpwd _overview

# Options
setopt auto_cd           # omit cd when entering a directory
setopt auto_pushd        # build directory stack
setopt pushd_ignore_dups # prevent directory stack from duplicate entries
setopt pushdminus        # reverse directory stack navigation
