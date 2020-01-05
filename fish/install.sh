#! /usr/bin/env bash

set -e

PACKAGE_NAME="fish"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="build/dist"
VERSION="3.0.2"
source ../util.sh

git-clone https://github.com/fish-shell/fish-shell
git-checkout-tag "$VERSION"
set-version "$VERSION"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-package "$BUILD_DIR"
