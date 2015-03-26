FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -X -D

RUN yum -y install bind-utils dmidecode supervisor ; yum clean all

#Setting minion configuration
RUN sed -i "s/#master:.*/master: 172.17.0.10/g" /etc/salt/minion

COPY supervisord.ini /etc/supervisord.d/

###EXPOSE 4505 4506

CMD ["/usr/bin/supervisord"]
