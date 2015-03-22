FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release

RUN yum -y install bind-utils
RUN yum -y instal dmidecode

RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M -D
####RUN sed "s/master:.*/master: $IP/" /etc/salt/minion > /etc/salt/minion

EXPOSE 4505 4506

###ENTRYPOINT [ "smtpd", "-d" ]
