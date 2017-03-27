# BUILD:
# docker build --force-rm --tag "rvannauker/skipper" --file skipper.dockerfile .
# RUN:
# docker run --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume $(pwd):/workspace --name="skipper" "rvannauker/skipper"
# PACKAGE: Skipper
# PACKAGE REPOSITORY: https://www.skipper18.com/en/download
# DESCRIPTION: Skipper provides Perfect ORM Definitions in a few seconds
FROM ubuntu:16.04
MAINTAINER Richard Vannauker <richard.vannauker@gmail.com>
# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL     org.label-schema.schema-version="1.0" \
          org.label-schema.build-date="$BUILD_DATE" \
          org.label-schema.version="$VERSION" \
          org.label-schema.name="" \
          org.label-schema.description="" \
          org.label-schema.vendor="SEOHEAT LLC" \
          org.label-schema.url="" \
          org.label-schema.vcs-ref="$VCS_REF" \
          org.label-schema.vcs-url="" \
          org.label-schema.usage="" \
          org.label-schema.docker.cmd="" \
          org.label-schema.docker.cmd.devel="" \
          org.label-schema.docker.cmd.test="" \
          org.label-schema.docker.cmd.debug="" \
          org.label-schema.docker.cmd.help="" \
          org.label-schema.docker.params="" \
          org.label-schema.rkt.cmd="" \
          org.label-schema.rkt.cmd.devel="" \
          org.label-schema.rkt.cmd.test="" \
          org.label-schema.rkt.cmd.debug="" \
          org.label-schema.rkt.cmd.help="" \
          org.label-schema.rkt.params="" \
          com.amazonaws.ecs.task-arn="" \
          com.amazonaws.ecs.container-name="" \
          com.amazonaws.ecs.task-definition-family="" \
          com.amazonaws.ecs.task-definition-version="" \
          com.amazonaws.ecs.cluster=""

RUN mkdir -p /workspace
WORKDIR /workspace
VOLUME /workspace

ENV SKIPPER_URL="http://downloads.skipper18.com/3.2.10.1367/Skipper-3.2.10.1367-Linux-all-64bit.zip"

RUN apt update -y && \
    apt remove --purge -y $(apt-mark showauto) && \
    apt install -y wget unzip libqt5gui5 && \
    export QT_PLUGIN_PATH="/usr/lib/x86_64-linux-gnu/qt5/plugins" && \
    wget ${SKIPPER_URL} -O /tmp/skipper.zip && \
    mkdir -p /opt/Skipper && \
    unzip /tmp/skipper.zip -d /opt/Skipper && \
    rm -rf /tmp/skipper.zip && \
    ln -s /opt/Skipper/Skipper /usr/bin && \
    apt remove --purge -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

ADD ["./Skipper.conf", "/root/.config/Inventic s.r.o./Skipper.conf"]

ENTRYPOINT /usr/bin/Skipper
