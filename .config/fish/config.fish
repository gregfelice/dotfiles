if test -f ./config.local.fish
    source ./config.local.fish
end

alias v nvim
alias ip "ip -c"
alias ipa "ip -4 -br addr"
alias lll "ls | grep '>'" # only symbolic links

fish_add_path $HOME/.bin

# zoxide cd tool
# zoxide init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f $HOME/anaconda3/bin/conda
    status is-interactive && eval /home/gregf/anaconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "$HOME/anaconda3/etc/fish/conf.d/conda.fish"
        . "$HOME/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH $HOME/anaconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# Dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=/home/gregf/.dotfiles/ --work-tree=/home/gregf'
