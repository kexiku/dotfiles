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
