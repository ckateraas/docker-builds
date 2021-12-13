#! /usr/bin/env bash

sudo ln -s /var/run/docker-host.sock /var/run/docker.sock
sudo chown node:node /var/run/docker.sock

exec "$@"
