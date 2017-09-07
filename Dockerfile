FROM ubuntu:latest
MAINTAINER Aaron Powell

RUN apt-get update && apt-get install -y curl unzip jq && \
    curl -o 1password.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.1/op_linux_amd64_v0.1.zip && \
    unzip 1password.zip -d /usr/bin && \
    rm 1password.zip

ENTRYPOINT /bin/bash