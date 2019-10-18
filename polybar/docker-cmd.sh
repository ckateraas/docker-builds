#! /usr/bin/env bash

set -e

cd build

cmake ..

make
make userconfig

echo 'Polybar' > description-pak

checkinstall \
  --type=debian \
  --maintainer=hvemvet \
  --nodoc \
  --pkgname=polybar \
  --pkgversion=$1 \
  --default \
  --pakdir=./dist \
  --instal=no \
  --replaces='polybar'
