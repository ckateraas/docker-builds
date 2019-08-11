#! /usr/bin/env bash

set -e

make

echo 'suckless terminal' > description-pak

checkinstall \
  --type=debian \
  --maintainer=hvemvet \
  --nodoc \
  --pkgname=st \
  --pkgversion="$1" \
  --default \
  --pakdir=./dist \
  --instal=no \
  --replaces='st'
