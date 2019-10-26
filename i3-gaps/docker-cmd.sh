#! /usr/bin/env bash

set -e

mkdir -p ./git-repo/dist
dpkg-buildpackage --jobs=auto -us -uc
# All .deb files are placed in .. by dpkg-buildpackage
cp ../*.deb ./dist
