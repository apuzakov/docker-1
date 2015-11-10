FROM ubuntu:14.04
MAINTAINER Thomas Steinbach <thomass@aikq.de>

COPY start.sh /usr/local/bin/start.sh
COPY backup /usr/local/bin/backup
COPY restore /usr/local/bin/restore

RUN echo "deb http://inverse.ca/ubuntu trusty trusty" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keys.gnupg.net --recv-key 0x810273C4 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y sogo && \
    mkdir /backups && \
    chown sogo:sogo /backups && \
    chmod 755 /usr/local/bin/*

VOLUME ["/backups"]
VOLUME ["/var/logs/sogo"]

CMD ["start.sh"]
