#!/usr/bin/env zsh

autoload colors; colors
green=${fg[green]}

echo "${green}This will install brew and everything that depends on it."
echo "It may take a while...$reset_color"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null

cd brew
for file in *.sh; do
  ./$file
done
