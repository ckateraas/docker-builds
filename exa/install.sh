#! /usr/bin/env bash

set -e

PACKAGE_NAME="exa"
IMAGE_NAME="$PACKAGE_NAME-builder"
BINARY_PATH="target/release/exa"
source ../util.sh

git-clone-recursive https://github.com/ogham/exa
git-pull
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-binary "$BINARY_PATH" "/usr/bin"
