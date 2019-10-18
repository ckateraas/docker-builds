#! /usr/bin/env bash

set -e

PACKAGE_NAME="st"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="/dist"
source ../util.sh

git-clone https://github.com/lukesmithxyz/st
git-pull

echo "Overiding config.h in $PACKAGE_NAME/"
cp ./config.h "$PACKAGE_NAME"

bump-package-version "$PACKAGE_NAME"
clean-build-dir "$BUILD_DIR"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME" "$PACKAGE_NAME"
install-package "$BUILD_DIR"
