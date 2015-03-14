FROM centos:6

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release
RUN yum -y install opensmtpd

RUN /bin/echo -e 'listen on 0.0.0.0\naccept from any for any relay' > /etc/smtpd.conf
RUN cat /etc/smtpd.conf

EXPOSE 25

ENTRYPOINT [ "smtpd", "-d" ]
