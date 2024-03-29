#! /usr/bin/env bash

set -e
GIT_REPO_DIR="./git-repo"

function clean-build-dir() {
  if [[ -d "$GIT_REPO_DIR/$1" ]]; then
    echo "Clearing out old builds in $GIT_REPO_DIR/$1"
    sudo rm -f "$GIT_REPO_DIR/$1/*.deb"
  else
    echo "Making directory, $GIT_REPO_DIR/$1, for binaries"
    mkdir -p "$GIT_REPO_DIR/$1"
  fi
}

function build-docker-image() {
  echo "Building Docker image $1"
  docker build -t "$1" .
}

function build-package() {
  echo "Building"
  docker run --rm -it -v "$(pwd)/$(basename $GIT_REPO_DIR)":/build "$1" /bin/build "$(cat ./version)"
}

function set-version() {
  echo "Version is set to $1"
  echo "$1" > ./version
}

function bump-package-version() {
  # VERSION has the format of "2.1.3-5"
  local VERSION
  local NEXT_VERSION_BODY
  local NEXT_PATCH_VERSION
  local NEW_VERSION
  VERSION=$(apt show "$1" 2>/dev/null | grep -i version | cut -d' ' -f2)
  if [[ -z "$VERSION" || "$VERSION" == "" ]]; then
    if [[ -f ./version ]]; then
      VERSION=$(cat ./version)
    else
      VERSION="1.0.0-0"
    fi
  fi
  NEXT_VERSION_BODY=$(echo "$VERSION" | cut -d'-' -f1)
  NEXT_PATCH_VERSION=$(echo "$VERSION" | cut -d'-' -f2 | awk '{ print $1 + 1}')
  NEW_VERSION="$NEXT_VERSION_BODY"-"$NEXT_PATCH_VERSION"
  echo "Updating package version from $VERSION to $NEW_VERSION"
  echo "$NEW_VERSION" > ./version
}

function install-package() {
  local PACKAGE_NAME=$(ls $GIT_REPO_DIR/$1 | grep "\.deb" | sort -nr | head -n1)
  echo "Installing built $GIT_REPO_DIR/$1/$PACKAGE_NAME"
  sudo dpkg -i "$GIT_REPO_DIR/$1/$PACKAGE_NAME"
}

function install-binary() {
  echo "Copying $GIT_REPO_DIR/$1 to $2"
  sudo cp "$GIT_REPO_DIR/$1" "$2"
}
