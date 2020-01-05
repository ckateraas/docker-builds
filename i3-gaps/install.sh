#! /usr/bin/env bash

set -e

PACKAGE_NAME="i3-wm"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="dist"
VERSION="4.17.1"
source ../util.sh

git-clone https://github.com/Airblader/i3
git-checkout-tag "$VERSION"
set-version "$VERSION"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-package "$BUILD_DIR"
