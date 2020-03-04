#!/usr/bin/env zsh

mkdir -p $HOME/Documents/github $HOME/Documents/bitbucket

if [ ! -e ~/.ssh/id_rsa.pub ]; then
  echo "ssh key not found - Generating..."
  ssh-keygen -f ~/.ssh/id_rsa -q -N ""
else
  echo "ssh key found copying"
fi

eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | pbcopy .
echo 'Please paste SSH key into github (and bitbucket if desired)'
