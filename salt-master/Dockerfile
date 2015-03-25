FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M -X -D

RUN yum -y install bind-utils dmidecode supervisor ; yum clean all

#Allow Salt-master access ANY minion (for test only)
RUN sed -i "s/#auto_accept: False/auto_accept: True/g" /etc/salt/master

#Setting minion configuration
RUN sed -i "s/#master:.*/master: localhost/g" /etc/salt/minion

COPY supervisord.ini /etc/supervisord.d/

EXPOSE 4505 4506

CMD ["/usr/bin/supervisord"]
