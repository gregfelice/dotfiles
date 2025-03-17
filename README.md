
This is the readme for my .dotfiles.

To install dotfiles on a new machine (this will overwrite existing files):

  mkdir -p ~/.dotfiles
  git clone --bare git@github.com:yourusername/dotfiles.git ~/.dotfiles
  config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"'
  $(config checkout -f)

Todo:

- Check for emacs daemon, handle it
- Figure out if you want to handle installing debian and macos pacakges for things like eva, pyenv, etc


