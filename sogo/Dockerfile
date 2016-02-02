FROM ubuntu:14.04
MAINTAINER Thomas Steinbach <thomass@aikq.de>

RUN echo "deb http://inverse.ca/ubuntu trusty trusty" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keys.gnupg.net --recv-key 0x810273C4 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      sogo \
      mysql-client \
      sope4.9-gdl1-mysql \
      python2.7 \
      python && \
    apt-get clean && \
    apt-get autoremove

COPY start.sh /usr/local/bin/start.sh
COPY backup /usr/local/bin/backup
COPY restore /usr/local/bin/restore
COPY addsogouser /usr/local/bin/addsogouser
COPY delsogouser /usr/local/bin/delsogouser

RUN mkdir /backups && \
    mkdir -p /usr/local/apache2/conf && \
    ln -s /etc/apache2/conf-available/SOGo.conf /usr/local/apache2/conf/httpd.conf && \
    chown sogo:sogo /backups && \
    #chown sogo:sogo /usr/local/apache2/htdocs &&\
    chown sogo:sogo /usr/local/apache2/conf/httpd.conf && \
    chmod 755 /usr/local/bin/* && \
    chsh -s /bin/bash sogo

RUN sed -i 's/127.0.0.1/sogo/g' /etc/apache2/conf-available/SOGo.conf && \
    echo "LoadModule alias_module modules/mod_alias.so\n\
LoadModule proxy_module modules/mod_proxy.so\n\
LoadModule proxy_http_module modules/mod_proxy_http.so\n\
LoadModule headers_module modules/mod_headers.so\n\
LoadModule rewrite_module modules/mod_rewrite.so\n\
LoadModule version_module modules/mod_version.so\n\
LoadModule authz_core_module modules/mod_authz_core.so\n\
LoadModule env_module modules/mod_env.so\n\
LoadModule access_compat_module modules/mod_access_compat.so\n\
LoadModule unixd_module modules/mod_unixd.so\n\
ServerRoot "/usr/local/apache2"\n\
Listen 80\n\
User daemon\n\
Group daemon\n\
DocumentRoot "/usr/local/apache2/htdocs"\n\
$(cat /etc/apache2/conf-available/SOGo.conf)" > /etc/apache2/conf-available/SOGo.conf

VOLUME ["/backups"]
VOLUME ["/var/log/sogo"]
VOLUME ["/etc/sogo"]

# data dir and available site for official httpd image
VOLUME ["/usr/lib/GNUstep/SOGo"]
VOLUME ["/etc/apache2/conf-available"]
VOLUME ["/usr/local/apache2/conf/"]

CMD ["start.sh"]
