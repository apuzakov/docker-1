FROM ubuntu:15.04
MAINTAINER Thomas Steinbach <thomas.steinbach@aikq.de>

RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y eatmydata && \
 DEBIAN_FRONTEND=noninteractive eatmydata apt-get -y install git supervisor eatmydata python-paramiko python-yaml python-jinja2 python-httplib2 python-setuptools

#ENV ANSIBLE_VERSION="--branch v1.9.1-1"
ENV ANSIBLE_VERSION=""

RUN \
  cd /opt && \
  eatmydata git clone ${ANSLIBLE_VERSION} git://github.com/ansible/ansible.git --recursive
RUN \
  mkdir -p /etc/ansible && \
  echo "localhost ansible_connection=local" > /etc/ansible/hosts && \
  echo "export ANSIBLE_HOSTS=/etc/ansible/hosts" >> ~/.bashrc && \
  echo "source /opt/ansible/hacking/env-setup -q" >> ~/.bashrc
