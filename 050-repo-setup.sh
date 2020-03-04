#!/usr/bin/env zsh
# Setup

autoload colors; colors
green=${fg[green]}
function greenmsg {
  echo "$green$1$reset_color"
}

# Copy my personal bin folder
greenmsg "setting up personal bin folder"
rm -rf ~/.local/bin
mkdir -p ~/.local
git clone git@github.com:$USER/bin ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

mkdir -p ~/.config
cd ~/.config
greenmsg "setting up .config repo"
gmerge .config
$HOME/.config/nvim/install.sh

cd ~
greenmsg "adding my dotfiles"
gmerge dotfiles.git
source .zshrc
