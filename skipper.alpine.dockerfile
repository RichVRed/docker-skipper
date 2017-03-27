# BUILD:
# docker build --force-rm --tag "rvannauker/skipper" --file skipper.dockerfile .
# RUN:
# docker run --rm --volume $(pwd):/workspace --name="skipper" "rvannauker/skipper" {destination} text cleancode,codesize,controversial,design,naming,unusedcode
# PACKAGE: Skipper
# PACKAGE REPOSITORY: https://github.com/skipper/skipper.git
# DESCRIPTION: Skipper is a spin-off project of PHP Depend and aims to be a PHP equivalent of the well known Java tool PMD. Skipper can be seen as an user friendly frontend application for the raw metrics stream measured by PHP Depend.
FROM alpine:latest
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

RUN apk update --quiet && \
    apk add --no-cache --quiet ca-certificates openssl wget go && \
    update-ca-certificates && \
    wget ${SKIPPER_URL} -O /tmp/skipper.zip && \
    mkdir -p /opt/Skipper && \
    unzip /tmp/skipper.zip -d /opt/Skipper && \
    rm -rf /tmp/skipper.zip && \
    ln -s /opt/Skipper/Skipper /usr/bin && \
    rm -rf /var/cache/apk/*

ENTRYPOINT /usr/bin/Skipper
