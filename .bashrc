# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ---------------------- local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------

export LANG=en_US.UTF-8
export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export TZ=America/New_York
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export HELP_BROWSER=w3m
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/Templates"
export SCRIPTS="$HOME/Scripts"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Movies"
export PDFS="$HOME/usb/pdfs"
export VIRTUALMACHINES="$HOME/VirtualMachines"
export CLIP_DIR="$VIDEOS/clips"
export CLIP_DATA="$GHREPOS/clip/data"
export CLIP_VOLUME=0
export CLIP_SCREEN=0
export TERM=xterm-256color
export CLICOLOR=1
export HRULEWIDTH=73
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export NVIM_SCREENKEY=1
export CGO_ENABLED=0
export PYTHONDONTWRITEBYTECODE=2
export LC_COLLATE=C
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

# gruvbox-material
export LS_COLORS="di=38;5;245:fi=38;5;223:ln=38;5;179:ex=38;5;108:*.txt=38;5;223"
export LESS="-FXR"
export LESS_TERMCAP_md=$'\e[1;33m'       # start bold (yellow)
export LESS_TERMCAP_mb=$'\e[1;35m'       # start blinking (magenta)
export LESS_TERMCAP_me=$'\e[0m'          # end bold/blinking
export LESS_TERMCAP_so=$'\e[38;5;108;1m' # start standout (green bold)
export LESS_TERMCAP_se=$'\e[0m'          # end standout
export LESS_TERMCAP_us=$'\e[4m'          # start underline
export LESS_TERMCAP_ue=$'\e[0m'          # end underline

export ANSIBLE_CONFIG="$HOME/.config/ansible/config.ini"
export ANSIBLE_INVENTORY="$HOME/.config/ansible/inventory.yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
#export ANSIBLE_STDOUT_CALLBACK=json

export K8SAPP_CLUSTER=dev

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

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

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
	if [[ -r "$HOME/.dircolors" ]]; then
		eval "$(dircolors -b "$HOME/.dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]' \
		g="\[\033[38;2;90;82;76m\]"

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="${g}╔$u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n${g}╚$p$P$x "
	double="${g}╔$u\u$g$PROMPT_AT$h\h$g:$w$dir\n${g}║$B\n${g}╚$p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi

	# if _have tmux && [[ -n "$TMUX" ]]; then
	# 	tmux rename-window "$(wd)"
	# fi
}

wd() {
	dir="${PWD##*/}"
	parent="${PWD%"/${dir}"}"
	parent="${parent##*/}"
	echo "$parent/$dir"
} && export wd

PROMPT_COMMAND="__ps1"

# --------------------------- Own Stuff ---------------------------

[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

[ -d "${HOME}/.dopr/bin" ] && PATH="${HOME}/.dopr/bin:${PATH}"

[ -f "${HOME}/perl5/perlbrew" ]  && source "${HOME}/perl5/perlbrew/etc/bashrc"

[ -f "${HOME}/.git-prompt.sh" ]  && source "${HOME}/.git-prompt.sh"

[ -f "${HOME}/.bash_aliases" ]   && source "${HOME}/.bash_aliases"
[ -f "${HOME}/.bash_functions" ] && source "${HOME}/.bash_functions"

[ -f "${HOME}/.fzf.bash" ]       && source "${HOME}/.fzf.bash"

[ -f /etc/bash_completion ]           && source /etc/bash_completion
[ -f "${HOME}/.git-completion.bash" ] && source "${HOME}/.git-completion.bash"

[ -f "${HOME}/.bashrc_own" ]   && source "${HOME}/.bashrc_own"
[ -f "${HOME}/.bashrc_local" ] && source "${HOME}/.bashrc_local"


[ -s "/home/schreider/.jabba/jabba.sh" ] && source "/home/schreider/.jabba/jabba.sh"

# Nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vi='nvim'
alias vim='nvim'

# Cargo
. "$HOME/.cargo/env"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
