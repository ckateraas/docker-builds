#! /usr/bin/env bash

set -e

function git-clone() {
  echo "Fetching Git repo $1"
  if [[ ! -d "$2" ]]; then
    git clone -q "$1" "$2"
  else
    echo "Skipping since $2 already exists"
  fi
}

function git-clone-recursive() {
  echo "Fetching Git repo $1"
  if [[ ! -d "$2" ]]; then
    git clone --recursive -q "$1" "$2"
  else
    echo "Skipping since $2 already exists"
  fi
}

function  git-pull() {
  cd "$1" || exit
  echo "Pulling latest changes in $1"
  git pull
  cd - || exit
}

function clean-build-dir() {
  if [[ -d "$1" ]]; then
    echo "Clearing out old builds in $1"
    sudo rm -f "$1"/*.deb
  else
    echo "Making directory, $1, for binaries"
    mkdir -p "$1"
  fi
}

function build-docker-image() {
  echo "Building Docker image $1"
  docker build -t "$1" .
}

function build-package() {
  echo "Building $2"
  docker run --rm -v "$(pwd)"/"$2":/build "$1" build "$(cat ./version)"
}

function bump-package-version() {
  # VERSION looks like 2.1.3-5
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
  echo "Installing .deb packages in $1"
  sudo apt install "$1"
}
