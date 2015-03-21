FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

###ENV IP=$(hostname -I)

RUN yum -y update && yum clean all
RUN yum -y install epel-release
RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M 
####RUN sed "s/master:.*/master: $IP/" /etc/salt/minion > /etc/salt/minion

EXPOSE 4505 4506

###ENTRYPOINT [ "smtpd", "-d" ]
