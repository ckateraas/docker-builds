#! /usr/bin/env bash

autoreconf --force --install

mkdir -p build/dist

cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make

echo 'i3-gaps & i3 with more features' > description-pak

checkinstall \
  --type=debian \
  --maintainer=hvemvet \
  --nodoc \
  --pkgname=i3-wm \
  --pkgversion=$1 \
  --default \
  --pakdir=./dist \
  --instal=no \
  --provides='x-window-manager' \
  --replaces='i3,i3-wm'
