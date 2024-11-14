# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
       . "$HOME/.bashrc"
    fi
fi


[ -s "/home/schreider/.jabba/jabba.sh" ] && source "/home/schreider/.jabba/jabba.sh"
. "$HOME/.cargo/env"
export PATH="/home/linuxbrew/.linuxbrew/opt/node@22/bin:$PATH"
