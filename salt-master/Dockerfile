FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release

RUN yum -y install dmidecode

RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M -X -D
RUN sed -i "s/master:.*/master: localhost/g" /etc/salt/minion 

EXPOSE 4505 4506

ENTRYPOINT [ "salt-master", "-d" ]
