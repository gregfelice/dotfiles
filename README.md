#  dotfiles usage:

# initialize the starter repo
git init --bare .dotfiles

# clone the dotfiles to your machine
mkdir ~/.dotfiles
git clone --bare <git@github.com:gregfelice/dotfiles.git   repo_url> ~/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

# add files or file changes
dotfiles add .bashrc .zshrc .emacs.d .config/
dotfiles commit -m "initial commit"
dotfiles remote add origin <your_remote_repo_url>
dotfiles branch -M main
dotfiles push -u origin main

