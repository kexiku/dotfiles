# .bash_profile

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# User-specific environment variables
export EDITOR="/usr/bin/micro"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Dont enable this shit for god sake
# export GTK_USE_PORTAL=1
