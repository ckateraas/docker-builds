FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential xcb libxcb-keysyms1-dev libxcb-util0-dev checkinstall

WORKDIR /build
COPY ./build.sh /build.sh
