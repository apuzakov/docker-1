FROM gliderlabs/alpine
MAINTAINER thomass at aikq.de

ADD start.sh /root/start.sh
RUN apk --update add bash && \
    chmod +x /root/start.sh

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/root/start.sh"]
