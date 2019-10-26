#! /usr/bin/env bash

set -e

PACKAGE_NAME="bat"
IMAGE_NAME="$PACKAGE_NAME-builder"
BINARY_PATH="target/release/bat"
source ../util.sh

git-clone-recursive https://github.com/sharkdp/bat
git-pull
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-binary "$BINARY_PATH"
