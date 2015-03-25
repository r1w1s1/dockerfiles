FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y install epel-release ; yum clean all
RUN yum -y update && yum clean all ; yum clean all
RUN yum -y install unbound ; yum clean all
RUN yum -y install bind-utils ; yum clean all

COPY cache.conf /etc/unbound/conf.d 

EXPOSE 53/udp

CMD ["/usr/sbin/unbound"]
