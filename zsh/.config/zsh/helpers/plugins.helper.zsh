is_plugin() {
  local base_dir=$1
  local name=$2
  builtin test -f "$base_dir/plugins/$name/$name.plugin.zsh"
}
