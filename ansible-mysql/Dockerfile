# prepares mysql image for use with thomass.httpd Ansible role
FROM mysql
MAINTAINER thomassteinbach<>xarif.de

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      python2.7 \
      python && \
    apt-get clean
