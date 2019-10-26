#! /usr/bin/env bash

set -e

PACKAGE_NAME="polybar"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="/build/dist"
source ../util.sh

git-clone-recursive https://github.com/polybar/polybar
#git-pull
bump-package-version "$PACKAGE_NAME"
clean-build-dir "$BUILD_DIR"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-package "$BUILD_DIR"
