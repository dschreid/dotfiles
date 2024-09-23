# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    case $(id -n -u) in
        "root")
            color_number=31
            ;;
        "websuche")
            color_number=32
            ;;
        "domainprofi")
            color_number=33
            ;;
        "dopr")
            color_number=33
            ;;
        *)
            color_number=34
            ;;
    esac

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_SHOWCONFLICTSTATE=1
    GIT_PS1_SHOWCOLORHINTS=1
    PS1='$(__git_ps1 "(%s) ")${debian_chroot:+($debian_chroot)}\[\033[01;'$color_number'm\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_SHOWCONFLICTSTATE=1
    PS1='$(__git_ps1 "(%s) ")${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# unset git config in case someone sets them by mistake
if [ "$(id -u)" = "0" ]; then
    git config --global --unset user.name
    git config --global --unset user.email
fi

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
alias vi='nvim'
alias vim='nvim'
. "$HOME/.cargo/env"
