FROM rust:1.57-slim-buster

RUN apt-get update && apt-get install -y build-essential clang

WORKDIR /build

COPY ./build.sh /build.sh
