# Clear on cd
_clear() {
  emulate -L zsh
  soft-clear 2> /dev/null || clear
}

# List the first 10 entries on cd
_overview() {
  emulate -L zsh
  [[ $PWD == $HOME ]] && return 0

  local -a entries=( *(DN/) *(DN^/) ) # Directories first, no error if empty
  local -i total=${#entries}

  (( total )) || return 0

  local -i shown=$(( total < 10 ? total : 10 ))

  local items=items
  (( total == 1 )) && items=item

  print -P "📂 %F{13}%~%f ✦ %F{13}${total} ${items}%f"

  command ls -ldhU --color=tty -- ${entries[1,shown]}

  local -i remaining=$(( total - shown ))

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
