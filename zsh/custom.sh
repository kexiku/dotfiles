# ANSI formatting helper
set_style() {
  [ $# -gt 0 ] || return # if called with no arguments, do nothing
  IFS=";" printf "\033[%sm" $* # concatenate all arguments with IFS
}
# syntax:
# \033[<code>m
# codes:
# 0:  reset
# 1:  bold
# 4:  underline
# 22: no bold
# 24: no underline
# 31: red
# 33: yellow

# if stdout is not a terminal ignore all formatting
[ -t 1 ] || set_style() { :; }

# protect against non-zsh execution
[ -n "$ZSH_VERSION" ] || {
  printf "$(set_style 1 31)Error:$(set_style 22) this file must be loaded by zsh.$(set_style 0)\n" >&2
  return 1
}

# Check if in emulation mode, if so early return
[[ "$(emulate)" = zsh ]] || {
  printf "$(set_style 1 31)Error:$(set_style 22) Oh My Zsh can't be loaded in \`$(emulate)\` emulation mode.$(set_style 0)\n" >&2
  return 1
}

unset -f set_style

# if ZSH is not defined, use the current script's directory
[[ -n "$ZSH" ]] || export ZSH="${${(%):-%x}:a:h}"

# add functions and completions dirs to fpath
fpath=($ZSH/{functions,completions} $fpath)

# autoload compinit
autoload -Uz compinit

# add all plugins from the 'plugins' array to fpath
is_plugin() {
  local base_dir=$1
  local name=$2
  builtin test -f $base_dir/plugins/$name/$name.plugin.zsh
}

for plugin ($plugins); do
  if is_plugin "$ZSH" "$plugin"; then
    fpath=("$ZSH/plugins/$plugin" $fpath)
  else
    echo "[zsh] Plugin '$plugin' not found."
  fi
done

# define zcompdump
$ZCOMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"

# run compinit
if [[ -n $ZCOMPDUMP(#qN.mh+24) ]]; then
  # full check and rebuild if a previous dump is older than a day
  compinit
else
  # skip the check otherwise
  compinit -C
fi

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
done
unset plugin

# Load the theme
is_theme() {
  local base_dir=$1
  local name=$2
  builtin test -f $base_dir/$name.zsh-theme
}

if [[ -n "$ZSH_THEME" ]]; then
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
else
  echo "[zsh] Theme '$ZSH_THEME' not found."
fi

# set completion colors to be the same as 'ls'
[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
