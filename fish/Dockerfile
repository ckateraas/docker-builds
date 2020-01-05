FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential libx11-dev libxft-dev \
  checkinstall cmake ncurses-dev vim \
  libncurses5-dev libpcre2-dev gettext

WORKDIR /build
COPY ./docker-cmd.sh /bin/build
