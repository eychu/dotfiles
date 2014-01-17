
# detect interactive shells
case "$-" in
    *i*) INTERACTIVE='yes' ;;
    *) unset INTERACTIVE ;;
esac

[ -z "$PS1" ] && return

if [ -f /bin/uname ]; then
    uname="/bin/uname"
else
    uname="/usr/bin/uname"
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

source ~/.bash/environment.sh
source ~/.bash/function.sh
source ~/.bash/config.sh
source ~/.bash/alias.sh
source ~/.bash/mac.sh
source ~/.bash/completion.sh
source ~/.bash/project-mgmt.sh
source ~/.bash/non-root.sh
source ~/.bash/git-completion.sh
source ~/.bash/git-flow-completion.sh

test -f ~/.bashrc.local && source ~/.bashrc.local

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Look for older .bash_profile.local files, warn me if one exists
test -f ~/.bash_profile.local && echo '   === .bash_profile.local exists ==='

# Make $? happy so new shells don't always start with {1} in the prompt
# test 'true'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PATH=/usr/local/go/bin:$PATH

if [ -f /usr/local/go ]; then
    export PATH=/usr/local/go/bin:$PATH
fi

if [ -f `brew --prefix`/etc/bash-completion ]; then
 . `brew --prefix`/etc/bash-completion
fi

if [ -f /opt/local/etc/bash_completion ]; then
 /opt/local/etc/bash_completion
fi

export CLICOLOR=1s
export LSCOLORS=ExFxCxDxCxegedabagacad
