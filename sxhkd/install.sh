#! /usr/bin/env bash

set -e

PACKAGE_NAME="sxhkd"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="dist"
source ../util.sh

git-clone https://github.com/baskerville/sxhkd
git-pull

bump-package-version "$PACKAGE_NAME"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-package "$BUILD_DIR"
