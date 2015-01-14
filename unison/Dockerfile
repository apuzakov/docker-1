FROM ubuntu:14.04.1
MAINTAINER Thomas Steinbach <thomass@aikq.de>
ENV DOCKER_TEMPLATE_VERSION 2015-01-04
RUN apt-get update
RUN DEBIAN_FRONTEND=none apt-get install -y unison

ENV UNISONLOCALHOSTNAME dockerunison

VOLUME ["/root/.unison"]
VOLUME ["/root/.ssh"]

ENTRYPOINT ["unison"]
