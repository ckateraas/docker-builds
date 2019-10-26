#! /usr/bin/env bash

set -e

PACKAGE_NAME="fish"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="/build/dist"
source ../util.sh

git-clone https://github.com/fish-shell/fish-shell
#git-pull
bump-package-version "$PACKAGE_NAME"
clean-build-dir "$BUILD_DIR"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-package "$BUILD_DIR"
