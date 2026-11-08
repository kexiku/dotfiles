# Clear a terminal when the current directory is $HOME
function _clear_on_cd() {
  if [[ $PWD = $HOME ]]; then
    emulate -L zsh; clear;
  fi
}

# List the first 10 entries in a directory
function _list_on_cd() {
  emulate -L zsh

  [[ $PWD = $HOME ]] && return

  local -a entries
  entries=( *(DN) ) # Avoid errors in empty dirs
  local total=${#entries}

  (( total == 0 )) && return

  local shown=$(( total < 10 ? total : 10 ))
  local items=$([[ $shown == 1 ]] && echo "item" || echo "items")

  print -P "✦ %F{12}${total} ${items}%f"

  command ls -lAh --color=always --group-directories-first | tail -n +2 | head -n 10

  local remaining=$(( total - shown ))

  if (( remaining > 0 )); then
    print -P "%F{8}└───────── \e[3m(${remaining} more)\e[0m%f"
  fi
}

# Add hooks to trigger on cd
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _clear_on_cd
add-zsh-hook chpwd _list_on_cd

# Options
setopt auto_cd           # omit cd when entering a directory
setopt auto_pushd        # build directory stack
setopt pushd_ignore_dups # prevent directory stack from duplicate entries
setopt pushdminus        # reverse directory stack navigation
