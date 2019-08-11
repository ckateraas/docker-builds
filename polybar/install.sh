#! /usr/bin/env bash

PACKAGE_NAME="polybar"
IMAGE_NAME="$PACKAGE_NAME-builder"
source ../util.sh

git-clone-recursive https://github.com/polybar/polybar "$PACKAGE_NAME"
git-pull "$PACKAGE_NAME"
bump-package-version "$PACKAGE_NAME"
clean-build-dir "$PACKAGE_NAME"/build/dist
build-docker-image "$IMAGE_NAME"
build-package "$IMAGE_NAME" "$PACKAGE_NAME"
install-package ./"$PACKAGE_NAME"/build/dist/*.deb
