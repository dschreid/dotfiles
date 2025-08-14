export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

plugins=(
  archlinux
  git
  rust
  docker
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ----------------------- environment variables ----------------------

export LANG=en_US.UTF-8
export TERM=xterm-256color

# --------------------------- Tmux Auto ---------------------------

if [[ -v WITH_TMUX ]]; then
  if [[ -z "$TMUX" ]]; then
      tmux attach -t main || tmux new -s main
  fi
fi

# --------------------------- Common ---------------------------

[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -f "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"

# --------------------------- Aliases ---------------------------

alias vi='nvim'
alias vim='nvim'

alias cat='bat'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
