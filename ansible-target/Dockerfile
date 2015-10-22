FROM ubuntu:15.04
MAINTAINER thomass@aikq.de

RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y python2.7 openssh-server sudo && \
 apt-get clean && \
 update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 && \
 /etc/init.d/ssh start && \
 /etc/init.d/ssh stop

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
