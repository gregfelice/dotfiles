if test -f $HOME/.config/fish/config.local.fish
    source $HOME/.config/fish/config.local.fish
end

alias v nvim
alias ip "ip -c"
alias ipa "ip -4 -br addr"
alias lll "ls | grep '>'" # only symbolic links

if not type -q eza
    echo "installing eza."
    sudo apt install eza
end

alias la 'eza -a --color=always --group-directories-first --icons'
alias ll 'eza -l --color=always --group-directories-first --icons'
alias ls 'eza -al --color=always --group-directories-first --icons'
alias lt 'eza -l --color=always --group-directories-first --icons -s=modified -r'

fish_add_path $HOME/.bin
fish_add_path $HOME/.local/bin

# zoxide
if not type -q zoxide
    echo "installing zoxide."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
end
zoxide init fish | source

if not type -q fzf
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
