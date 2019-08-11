#! /usr/bin/env bash

source ../util.sh

echo "Fetching Git repo for fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git

git-pull fzf

echo "Running installer for fzf"
cd fzf
./install

echo "Moving built binary into /usr/local/bin"
sudo cp bin/fzf /usr/local/bin/fzf
