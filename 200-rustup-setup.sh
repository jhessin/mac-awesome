#!/usr/bin/env zsh

curl https://sh.rustup.rs -sSf | sh

source ~/.cargo/env

cd rustup
for file in *.sh; do
  ./$file
done
