# # set color variables such as $fg, $bg, $color and $reset_color
autoload -Uz colors && colors

# # default ls coloring
if [[ -z "$LS_COLORS" ]]; then
  if [[ -f "$HOME/.dircolors" ]]; then
    source <(dircolors -b "$HOME/.dircolors")
  else
    source <(dircolors -b)
  fi
fi
