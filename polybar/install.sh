#! /usr/bin/env bash

set -e

PACKAGE_NAME="polybar"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="build/dist"
VERSION="3.4.1"
source ../util.sh

git-clone-recursive https://github.com/polybar/polybar
git-checkout-tag "$VERSION"
set-version "$VERSION"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
# install-package "$BUILD_DIR"
