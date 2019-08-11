#! /usr/bin/env bash

set -e

PACKAGE_NAME="fish"
IMAGE_NAME="$PACKAGE_NAME-builder"
source ../util.sh

git-clone https://github.com/fish-shell/fish-shell "$PACKAGE_NAME"
git-pull "$PACKAGE_NAME"
bump-package-version "$PACKAGE_NAME"
clean-build-dir "$PACKAGE_NAME"/dist
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME" "$PACKAGE_NAME"
install-package ./"$PACKAGE_NAME"/build/dist/*.deb
