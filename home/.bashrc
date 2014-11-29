# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

EDITOR=emacs; export EDITOR
SHELL=bash; export SHELL

. .alii

# source ~/.bin/tmuxinator.bash

. .sshagent

. .gitbash


NP_PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin:$NP_PATH" # Add RVM to PATH for scripting

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
