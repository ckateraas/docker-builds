FROM ubuntu:18.04

RUN cp /etc/apt/sources.list /etc/apt/sources.list.old
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
  libstartup-notification0-dev libxcb-randr0-dev \
  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev \
  git checkinstall devscripts dpkg-dev dh-autoreconf

WORKDIR /build
RUN apt-get -y build-dep i3-wm
COPY ./build.sh /build.sh
