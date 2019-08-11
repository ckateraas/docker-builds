FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y libcairo2-dev libpango1.0-dev libconfig-dev \
    libxcb-randr0-dev libxcb-ewmh-dev libxcb-icccm4-dev libgdk-pixbuf2.0-dev \
    libasound2-dev libiw-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-xkb-dev \
    git checkinstall asciidoc docbook-xml xsltproc

WORKDIR /build
COPY ./docker-cmd.sh /bin/build
