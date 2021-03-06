#! /usr/bin/env bash

set -e

mkdir -p build
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
  --install=no \
  --replaces='fish'
