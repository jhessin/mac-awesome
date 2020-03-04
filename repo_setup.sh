#!/usr/bin/env zsh
# Setup

# Copy my personal bin folder
rm -rf ~/.local/bin
mkdir -p ~/.local
git clone git@github.com:$USER/bin ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

mkdir -p ~/.config
cd ~/.config
gmerge .config
$HOME/.config/nvim/install.sh

cd ~
gmerge dotfiles.git
source .zshrc
