FROM php:7.0-apache
MAINTAINER thomas.steinbach@aikq.de

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    ffmpeg \
    imagemagick \
    libjpeg-progs \
    exiftool \
    unzip \
    wget

RUN cd /tmp && \
    wget https://github.com/WPO-Foundation/webpagetest/releases/download/WebPageTest-2.18/webpagetest_2.18.zip && \
    unzip webpagetest_2.18.zip && \
    cp -a www/* /var/www/html
