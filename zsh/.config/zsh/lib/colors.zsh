# set color variable such as $fg, $bg, $color and $reset_color
autoload -Uz colors && colors

# allow variables and commands in PROMPT variables
setopt prompt_subst

# use diff --color if available
if command diff --color /dev/null{,} &>/dev/null; then
  function diff {
    command diff --color "$@"
  }
fi

# default coloring for GNU-based ls
if [[ -z "$LS_COLORS" ]]; then
  if (( $+commands[dircolors] )); then # define LS_COLORS via dircolors if available
    [[ -f "$HOME/.dircolors" ]] \
      && source <(dircolors -b "$HOME/.dircolors") \
      || source <(dircolors -b)
  else # Otherwise, set a default equivalent to LSCOLORS (generated via https://geoff.greer.fm/lscolors)
    export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
  fi
fi

# set ls alias
alias ls='ls --color=tty'
