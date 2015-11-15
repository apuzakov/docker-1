FROM ubuntu:15.04
MAINTAINER thomass@aikq.de

COPY keys/id_rsa root/id_rsa
COPY keys/id_rsa.pub root/.ssh/authorized_keys
COPY printPrivateKey /usr/local/bin/printPrivateKey
COPY readPublicKey /usr/local/bin/readPublicKey

RUN \
 chmod -R 0700 root/id_rsa root/.ssh/authorized_keys && \
 chmod 0755 /usr/local/bin/* && \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y python2.7 openssh-server sudo && \
 apt-get clean && \
 update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 && \
 /etc/init.d/ssh start && \
 /etc/init.d/ssh stop

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
