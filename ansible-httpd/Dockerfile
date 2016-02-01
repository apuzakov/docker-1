# prepares httpd image for use with thomass.httpd Ansible role
FROM httpd:2.4
MAINTAINER thomassteinbach<>xarif.de

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      python2.7 \
      python && \
    apt-get clean
