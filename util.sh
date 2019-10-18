#! /usr/bin/env bash

set -e
GIT_REPO_DIR="./git-repo"

function git-clone() {
  echo "Fetching Git repo $1"
  if [[ ! -d "$GIT_REPO_DIR" ]]; then
    git clone -q "$1" $GIT_REPO_DIR
  else
    echo "Skipping since $GIT_REPO_DIR already exists"
  fi
}

function git-clone-recursive() {
  echo "Fetching Git repo $1"
  if [[ ! -d "$GIT_REPO_DIR" ]]; then
    git clone --recursive -q "$1" $GIT_REPO_DIR
  else
    echo "Skipping since $GIT_REPO_DIR already exists"
  fi
}

function  git-pull() {
  cd $GIT_REPO_DIR || exit
  echo "Pulling latest changes in $GIT_REPO_DIR"
  git pull
  cd - || exit
}

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
  echo "Installing built .deb files in $GIT_REPO_DIR/$1"
  sudo apt install $GIT_REPO_DIR/"$1"/*.deb
}
