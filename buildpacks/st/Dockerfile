FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential libx11-dev libxft-dev checkinstall

WORKDIR /build
COPY ./docker-cmd.sh /bin/build
