FROM mysql
MAINTAINER Thomas Steinbach (thomas.steinbach@aikq.de)

RUN \
  groupadd -r -g 1000 user1000 && \
  useradd -r -g user1000 -u 1000 user1000 && \
  apt-get update && \
  apt-get install -y p7zip && \
  apt-get clean

# The backup/restore script starts mysql with a copied data dir
# of the remote container which could not have be the same path.
# Thus switch the local datadir to /tmp/mysql
RUN sed -i 's/var\/lib\/mysql/tmp\/mysql/g' /etc/mysql/my.cnf

ADD start.sh /root/start.sh

VOLUME ["/backup"]

ENTRYPOINT ["/root/start.sh"]
