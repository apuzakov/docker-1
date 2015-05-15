FROM mysql
MAINTAINER Thomas Steinbach (thomas.steinbach@aikq.de)

RUN \
  groupadd -r -g 1000 user1000 && \
  useradd -r -g user1000 -u 1000 user1000 && \
  apt-get update && \
  apt-get install -y python p7zip && \
  apt-get clean

ADD start.sh /root/start.sh
ADD tarpaths.py /root/tarpaths.py

VOLUME ["/backup"]

ENTRYPOINT ["/root/start.sh"]
