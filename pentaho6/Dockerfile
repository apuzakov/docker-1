FROM java:8-jre

RUN adduser --disabled-password --gecos '' pentaho && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y unzip

USER pentaho

RUN cd /home/pentaho && \
    wget -O biserver.zip http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/6.0/biserver-ce-6.0.0.0-353.zip?r=&ts=1445855129&use_mirror=netassist
    unzip biserver.zip

WORKDIR /home/pentaho/biserver-ce

ENTRYPOINT["/bin/bash"]
CMD["/home/pentaho/biserver/start-pentaho.sh"]
