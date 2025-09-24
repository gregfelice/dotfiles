#!/bin/bash

# This script is designed to be run from a curl command.
# It installs the dotfiles repository and sets up the dotfiles alias.

set -e

# Variables
DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="git@github.com:gregfelice/dotfiles.git"

# Check if git is installed
if ! command -v git &>/dev/null; then
  echo "Error: git is not installed. Please install git and try again."
  exit 1
fi

# Check if the dotfiles directory already exists
if [ -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles directory already exists. Skipping cloning."
else
  # Clone the bare dotfiles repository
  echo "Cloning the dotfiles repository to $DOTFILES_DIR..."
  git clone --bare "$REPO_URL" "$DOTFILES_DIR"
fi

# Set up the dotfiles alias
dotfiles() {
  git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
}

# Back up any conflicting dotfiles
echo "Backing up conflicting dotfiles..."
dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | while read -r file; do
  if [ -e "$file" ]; then
    echo "Backing up $file to ${file}.bak"
    mv "$file" "${file}.bak"
  fi
done

# Checkout the dotfiles
echo "Checking out dotfiles..."
dotfiles checkout

# Add the dotfiles alias to the shell configuration file
echo "Adding dotfiles alias to shell configuration file..."
if [ -n "$(echo "$SHELL" | grep "zsh")" ]; then
  CONFIG_FILE="$HOME/.zshrc"
elif [ -n "$(echo "$SHELL" | grep "bash")" ]; then
  CONFIG_FILE="$HOME/.bashrc"
elif [ -n "$(echo "$SHELL" | grep "fish")" ]; then
  CONFIG_FILE="$HOME/.config/fish/config.fish"
else
  echo "Warning: Could not determine shell. Please add the following alias to your shell configuration file manually:"
  echo "alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'"
  exit 0
fi

if ! grep -q "alias dotfiles=" "$CONFIG_FILE"; then
  echo "Adding alias to $CONFIG_FILE"
  echo "" >>"$CONFIG_FILE"
  echo "# Dotfiles alias" >>"$CONFIG_FILE"
  echo "alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >>"$CONFIG_FILE"
fi

echo "Dotfiles installation complete!"
echo "Please restart your shell or run 'source $CONFIG_FILE' to use the 'dotfiles' alias."
