FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release

RUN yum -y install bind-utils
RUN yum -y instal dmidecode

RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M -X -D
RUN sed "s/master:.*/master: localhost/" /etc/salt/minion > /etc/salt/minion

RUN systemctl start salt-master.service 
RUN systemctl start salt-minion.service

EXPOSE 4505 4506

###ENTRYPOINT [ "smtpd", "-d" ]
