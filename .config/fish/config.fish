if test -f $HOME/.config/fish/config.local.fish
    source $HOME/.config/fish/config.local.fish
end

alias v nvim
alias ip "ip -c"
alias ipa "ip -4 -br addr"
alias lll "ls | grep '>'" # only symbolic links

fish_add_path $HOME/.bin
fish_add_path $HOME/.local/bin

# zoxide
if type -q zoxide
    echo "zoxide already installed."
else
    echo "installing zoxide."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
end
zoxide init fish | source

if type -q fzf
    echo "fzf already installed."
else
    echo "installing fzf."
    sudo apt install fzf
end

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
