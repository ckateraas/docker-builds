FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential
RUN apt-get install -y libx11-dev libxft-dev
RUN apt-get install -y checkinstall

WORKDIR /build
COPY ./docker-cmd.sh /bin/build
