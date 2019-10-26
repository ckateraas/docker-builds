#! /usr/bin/env bash

set -e

make yabar
make docs

echo 'Yabar' > description-pak

checkinstall \
  --type=debian \
  --maintainer=hvemvet \
  --nodoc \
  --pkgname=yabar \
  --pkgversion=$1 \
  --default \
  --pakdir=./dist \
  --install=no \
  --replaces='yabar'
