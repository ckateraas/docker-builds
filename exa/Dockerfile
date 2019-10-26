FROM rust:1.38-slim-buster

RUN apt-get update && apt-get install -y build-essential clang

WORKDIR /build

COPY ./docker-cmd.sh /bin/build
