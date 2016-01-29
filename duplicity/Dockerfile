FROM ubuntu:15.10
MAINTAINER Thomas Steinbach <thomass@aikq.de>

ENV DOCKER_TEMPLATE_VERSION 2016-01-29
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y duplicity && \
    apt-get clean

ENTRYPOINT ["duplicity"]
