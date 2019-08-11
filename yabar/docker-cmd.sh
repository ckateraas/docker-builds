#! /usr/bin/env bash

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
  --instal=no \
  --replaces='yabar'
