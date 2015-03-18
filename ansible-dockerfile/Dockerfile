FROM ubuntu:14.04.1
MAINTAINER Thomas Steinbach <thomass@aikq.de>
ENV DOCKER_TEMPLATE_VERSION 2015-02-25
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install ansible python-apt

ADD playbook /playbook/
RUN cd /playbook && ansible-playbook run.yml

EXPOSE 80

ENTRYPOINT cd /playbook && ansible-playbook run.yml && read nothing
