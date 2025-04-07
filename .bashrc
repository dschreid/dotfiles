# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ---------------------- local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------
export TERM=xterm-256color

# ignoreboth = use both 'ignorespace' and 'ignoredups'
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTFILESIZE=10000
export HISTSIZE=10000

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# --------------------------- Tmux Auto ---------------------------

# Start tmux automatically if not already inside a tmux session
if command -v tmux >/dev/null 2>&1; then
  # Check if already inside tmux
  if [ -z "$TMUX" ]; then
    # Try to attach to an existing session named 'main', else create it
    tmux attach -t main || tmux new -s main
  fi
fi

# --------------------------- Own Stuff ---------------------------

[ -d "${HOME}/.local/kitty.app/bin" ] && PATH="${HOME}/.local/kitty.app/bin:${PATH}"
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

[ -d "${HOME}/.dopr/bin" ] && PATH="${HOME}/.dopr/bin:${PATH}"

[ -f "${HOME}/perl5/perlbrew" ]  && source "${HOME}/perl5/perlbrew/etc/bashrc"

[ -f "${HOME}/.bashrc_own" ]   && source "${HOME}/.bashrc_own"
[ -f "${HOME}/.bashrc_local" ] && source "${HOME}/.bashrc_local"


[ -s "/home/schreider/.jabba/jabba.sh" ] && source "/home/schreider/.jabba/jabba.sh"

# --------------------------- Aliases ---------------------------

# Nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vi='nvim'
alias vim='nvim'

# Cargo
. "$HOME/.cargo/env"

alias generate-ssh-config-me='generate-ssh-config --user schreider'

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(starship init bash)"
