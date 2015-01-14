FROM ubuntu:14.04.1
MAINTAINER Thomas Steinbach <thomass@aikq.de>
ENV DOCKER_TEMPLATE_VERSION 2015-01-04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ssh-client

VOLUME ["/root/.ssh"]

CMD ["ssh"]
