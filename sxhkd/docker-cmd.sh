#! /usr/bin/env bash

set -e

make

echo 'sxhkd' > description-pak

checkinstall \
  --type=debian \
  --maintainer=hvemvet \
  --nodoc \
  --pkgname=sxhkd \
  --pkgversion="git describe --tags 2> /dev/null" \
  --default \
  --pakdir=./dist \
  --install=no \
  --replaces=sxhkd
