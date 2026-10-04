# Sets color variable such as $fg, $bg, $color and $reset_color
autoload -U colors && colors

# Expand variables and commands in PROMPT variables
setopt prompt_subst

# Use diff --color if available
if command diff --color /dev/null{,} &>/dev/null; then
  function diff {
    command diff --color "$@"
  }
fi

# Don't set ls coloring if disabled
[[ "$DISABLE_LS_COLORS" != true ]] || return 0

# Default coloring for GNU-based ls
if [[ -z "$LS_COLORS" ]]; then
  # Define LS_COLORS via dircolors if available. Otherwise, set a default
  # equivalent to LSCOLORS (generated via https://geoff.greer.fm/lscolors)
  if (( $+commands[dircolors] )); then
    [[ -f "$HOME/.dircolors" ]] \
      && source <(dircolors -b "$HOME/.dircolors") \
      || source <(dircolors -b)
  else
    export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
  fi
fi

function test-ls-args {
  # Usage: test-ls-args cmd args...
  # e.g. test-ls-args gls --color
  command "$@" /dev/null &>/dev/null
}

if test-ls-args ls --color; then
  alias ls='ls --color=tty'
elif test-ls-args ls -G; then
  alias ls='ls -G'
fi

unfunction test-ls-args
