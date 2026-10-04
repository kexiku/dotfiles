# load all of the plugins defined in ~/.zshrc
for plugin ($plugins); do
  source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
done
unset plugin

# load the theme
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

# enable zsh-allclear plugin
# (from https://github.com/givensuman/zsh-allclear)
source "$ZSH/plugins/zsh-allclear/zsh-allclear.plugin.zsh"
