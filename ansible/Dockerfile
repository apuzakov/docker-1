FROM ubuntu:15.04
MAINTAINER Thomas Steinbach <thomas.steinbach@aikq.de>

# static environment variables
ENV ANSIBLE_HOSTS=/etc/ansible/hosts
ENV PATH=/opt/ansible/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHONPATH=/opt/ansible/lib:
ENV MANPATH=/opt/ansible/docs/man:

# prerequisites
RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y eatmydata && \
 DEBIAN_FRONTEND=noninteractive eatmydata apt-get -y install git supervisor eatmydata python-paramiko python-yaml python-jinja2 python-httplib2 python-setuptools && \
  mkdir -p /etc/ansible && \
  echo "localhost ansible_connection=local" > /etc/ansible/hosts

# dynamic environment variable - set to desired version
#ENV ANSIBLE_VERSION="--branch v1.9.1-1"
ENV ANSIBLE_VERSION=""

# installation process
RUN \
  cd /opt && \
  eatmydata git clone ${ANSLIBLE_VERSION} git://github.com/ansible/ansible.git --recursive && \
  /bin/bash -c 'source /opt/ansible/hacking/env-setup'
