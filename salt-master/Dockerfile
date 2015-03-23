FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y install epel-release

#RUN yum -y install bind-utils
RUN yum -y install dmidecode

RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M -X -D

#Allow Salt-master access ANY minion (for test only) 
RUN sed -i "s/#auto_accept: False/#auto_accept: True/g" /etc/salt/master

RUN sed -i "s/#master:.*/master: localhost/g" /etc/salt/minion

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 4505 4506

CMD "/usr/local/bin/run.sh"
