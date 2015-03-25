FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y install epel-release ; yum clean all
RUN yum -y install unbound supervisor bind-utils; yum clean all

COPY cache.conf /etc/unbound/conf.d 
COPY supervisord.ini /etc/supervisord.d/

EXPOSE 53/udp

CMD ["/usr/bin/supervisord"]
