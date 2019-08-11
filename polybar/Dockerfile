FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential clang-7 git cmake cmake-data pkg-config python3-sphinx \
  libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev \
  python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
  # Optional run dependencies
  libpulse-dev i3-wm libasound2-dev libxcb-cursor-dev libxcb-xrm-dev libxcb-xkb-dev \
  libnl-genl-3-dev libjsoncpp-dev \
  git checkinstall

WORKDIR /build
COPY ./docker-cmd.sh /bin/build
