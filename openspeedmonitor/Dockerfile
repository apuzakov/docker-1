FROM tomcat:7.0.64-jre7
MAINTAINER thomas.steinbach@aikq.de

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
      git \
      openjdk-7-jdk && \
    git clone https://github.com/IteraSpeed/OpenSpeedMonitor.git

ADD build.sh OpenSpeedMonitor/build.sh

RUN cd OpenSpeedMonitor && \
    chmod +x build.sh && \
    sleep 1 && \
    ./build.sh && \
    mv target/*.war /usr/local/tomcat/webapps/OpenSpeedMonitor.war

ADD OpenSpeedMonitor-config.groovy /root/.grails/OpenSpeedMonitor-config.groovy
