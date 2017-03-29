FROM ubuntu:16.04
MAINTAINER Thomas Steinbach <thomass@aikq.de>
ENV DOCKER_TEMPLATE_VERSION 2015-03-17
RUN apt-get update && apt-get install -y apt-mirror

ADD mirror.list /etc/apt/mirror.list


VOLUME ["/var/spool/apt-mirror"]

CMD ["apt-mirror"]
