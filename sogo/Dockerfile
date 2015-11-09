FROM ubuntu:14.04
MAINTAINER Thomas Steinbach <thomass@aikq.de>

RUN echo "deb http://inverse.ca/ubuntu trusty trusty" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keys.gnupg.net --recv-key 0x810273C4 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y sogo

CMD ["/etc/init.d/sogo", "start"]
