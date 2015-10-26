FROM java:8-jre

RUN adduser --disabled-password --gecos '' pentaho

USER pentaho

RUN cd /home/pentaho && \
    wget -O biserver.zip 'http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/6.0/biserver-ce-6.0.0.0-353.zip?r=&ts=1445855129&use_mirror=netassist' && \
    unzip biserver.zip && \
    rm biserver.zip

WORKDIR /home/pentaho/biserver-ce

CMD ["/home/pentaho/biserver-ce/start-pentaho.sh"]
