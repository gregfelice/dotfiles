function install_eza
    if not type -q eza
        echo "installing eza."
        sudo apt install eza
    end
    alias la 'eza -a --group-directories-first --icons'
    alias ll 'eza -l --group-directories-first --icons'
    alias ls 'eza -al --group-directories-first --icons'
    alias lt 'eza -l --group-directories-first --icons -s=modified -r'
end

function install_zoxide
    if not type -q zoxide
        echo "installing zoxide."
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    end
    zoxide init fish | source
end

function install_fzf
    if not type -q fzf
        echo "installing fzf."
        sudo apt install fzf
    end
end

function initialize_conda
    # !! Contents within this block are managed by 'conda init' !!
    if test -f $HOME/anaconda3/bin/conda
        status is-interactive && eval /home/gregf/anaconda3/bin/conda "shell.fish" hook $argv | source
    else
        if test -f "$HOME/anaconda3/etc/fish/conf.d/conda.fish"
            source "$HOME/anaconda3/etc/fish/conf.d/conda.fish"
        else
            set -x PATH $HOME/anaconda3/bin $PATH
        end
    end
end

function install_tmux
    if not type -q tmux
        echo "installing tmux"
        sudo apt install tmux
    end
    if not test -d ~/.tmux/plugins/tpm
        echo "cloning tmux tpm"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    end
end

fish_add_path $HOME/.bin
fish_add_path $HOME/.local/bin

alias v nvim
alias ip "ip -c"
alias ipa "ip -4 -br addr"
alias lll "ls | grep '>'" # only symbolic links

install_eza
install_zoxide
install_fzf
initialize_conda
install_tmux

set -x EDITOR nvim

alias dotfiles='/usr/bin/git --git-dir=/home/gregf/.dotfiles/ --work-tree=/home/gregf'

# source local fish config if exists
if test -f $HOME/.config/fish/config.local.fish
    source $HOME/.config/fish/config.local.fish
end
