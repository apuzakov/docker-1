FROM ubuntu:16.04
MAINTAINER Thomas Steinbach <thomas.steinbach@aikq.de>

RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get -y install \
  ssh-client \
  python-pip \
  python-docker && \
 apt-get clean && \
 apt-get autoclean

RUN pip install ansible

RUN mkdir -p /etc/ansible && \
    echo "localhost ansible_ssh_host=172.17.0.1" > /etc/ansible/hosts

RUN adduser --disabled-password --gecos '' uid1000
USER uid1000
WORKDIR /home/uid1000/ansible
