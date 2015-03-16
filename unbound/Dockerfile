FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y install epel-release
RUN yum -y update && yum clean all
RUN yum -y install unbound 
RUN yum -y install bind-utils 

COPY cache.conf /etc/unbound/conf.d 

EXPOSE 53/udp

CMD ["/usr/sbin/unbound"]
