FROM centos:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release
RUN yum -y install opensmtpd

RUN /bin/echo -e 'listen on 0.0.0.0\naccept from any for any relay' > /etc/opensmtpd/smtpd.conf

EXPOSE 25

ENTRYPOINT [ "smtpd", "-d" ]
