#! /usr/bin/env bash

set -e

PACKAGE_NAME="yabar"
IMAGE_NAME="$PACKAGE_NAME-builder"
BUILD_DIR="/dist"
source ../util.sh

git-clone https://github.com/geommer/yabar "$PACKAGE_NAME"
git-pull "$PACKAGE_NAME"
bump-package-version "$PACKAGE_NAME"
clean-build-dir "$BUILD_DIR"
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME"
install-package "$BUILD_DIR"
