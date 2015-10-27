FROM java:7-jre

RUN adduser --disabled-password --gecos '' pentaho

ADD start.sh /home/pentaho/biserver-ce/start.sh

RUN chmod +x /home/pentaho/biserver-ce/start.sh && \
    chown -R pentaho:pentaho /home/pentaho

USER pentaho

RUN cd /home/pentaho && \
    #wget -O biserver.tar.gz 'http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/3.9.0-stable/biserver-ce-3.9.0-stable.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentaho%2Ffiles%2FBusiness%2520Intelligence%2520Server%2F3.9.0-stable%2F&ts=1445886917&use_mirror=skylink' && \
    wget -O biserver.tar.gz 'http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/3.8.0-stable/biserver-ce-3.8.0-stable.tar.gz' && \
    tar xzf biserver.tar.gz && \
    rm biserver.tar.gz

WORKDIR /home/pentaho/biserver-ce
EXPOSE 8080 8099

CMD ["/home/pentaho/biserver-ce/start.sh"]
