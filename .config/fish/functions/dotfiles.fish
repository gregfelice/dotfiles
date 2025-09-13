###################################################################
# config dot file usage:
#
# initialize the starter repo
#   git init --bare .dotfiles
#
# clone the dotfiles to your machine
#   mkdir ~/.dotfiles
#   git clone --bare <repoo_url> ~/.dotfiles
#   alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#   config checkout

# add files or file changes
#   config add .bashrc .zshrc .emacs.d .config/
#   config commit -m "initial commit"
#   config remote add origin <your_remote_repo_url>
#   config branch -M main
#   config push -u origin main
#
###################################################################

function dotfiles --wraps='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' --description 'alias dotfiles git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end
