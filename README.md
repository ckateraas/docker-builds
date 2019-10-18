# Docker builds

Builds several programs and utilities using Docker.

## Dependencies

To build these programs you need to install the following dependencies:

- `docker`
- `git`
- `vim` or another editor

## Building

Run the `install.sh` script in the root of this project to build _all_ the programs.
Otherwise, you can run `install.sh` inside the program folder(s) you want built.

## Platforms and distributions

The setup currently only works for Ubuntu and other distros with `apt` available.

## How does this work?

The procedure for build and then installing the built binary is the following:

0. Create a custom Docker image for building the binary.
1. Clone and fetch the latest from the projects Git repo.
2. Build a `.deb`, inside a Docker container, using `checkinstall`.
3. Install the binary on the host system using `apt`.

## Folder structure

Each of the folders are structured similarly, where each folder contains:

- `Dockerfile` defines the Docker image to build inside.
- `docker-cmd.sh` is the command run by the Docker container on startup.
- `install.sh` builds and installs the program locally.
- `version` is a file to keep track of the version the program.
- A folder containing the Git repo for the program.
- `.gitignore` to ignore certain files from Git.
