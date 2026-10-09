# path
export PATH=$HOME/.local/bin:$PATH:/usr/games

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL="nano"
  export EDITOR="nano"
else
  export VISUAL="nano"
  export EDITOR="nano"
fi
