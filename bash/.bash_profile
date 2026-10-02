# .bash_profile

# Get aliases and functions
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# User-specific environment variables
export EDITOR="/usr/bin/micro"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
