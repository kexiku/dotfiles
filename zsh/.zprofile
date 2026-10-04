# user-specific environment variables
export PATH=$HOME/bin:$HOME/.local/bin:/usr/games:$PATH
export ZSH="$HOME/.zsh"

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
