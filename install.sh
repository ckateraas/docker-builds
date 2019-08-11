#! /usr/bin/env bash

set -e

apt install -y snapd git vim

echo "export PATH=$PATH:/snap/bin" >> /etc/bash.bashrc

snap install docker

cd fish
./install.sh

cd fzf
./install.sh

cd i3-gaps
./install.sh

cd st
./install.sh

cd yabar
./install.sh
