FROM ubuntu:16.04
MAINTAINER Thomas Steinbach <thomas.steinbach@aikq.de>

RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get -y install \
  python-pip \
  python-docker

RUN mkdir -p /etc/ansible && \
 echo "localhost ansible_ssh_host=172.17.0.1" > /etc/ansible/hosts && \
 pip install ansible && \
 apt-get clean && \
 apt-get autoclean
