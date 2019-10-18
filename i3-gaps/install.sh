#! /usr/bin/env bash

set -e

PACKAGE_NAME="i3-wm"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="/dist"
source ../util.sh

git-clone https://github.com/Airblader/i3
git-pull
bump-package-version "$PACKAGE_NAME"
clean-build-dir "$BUILD_DIR"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME" "$PACKAGE_NAME"
install-package "$BUILD_DIR"
