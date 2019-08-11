#! /usr/bin/env bash

mkdir build

cd build

cmake ..

make

echo 'Fish shell' > description-pak

checkinstall \
  --type=debian \
  --maintainer=hvemvet \
  --nodoc \
  --pkgname=fish \
  --pkgversion=$1 \
  --default \
  --pakdir=./dist \
  --instal=no \
  --replaces='fish'
