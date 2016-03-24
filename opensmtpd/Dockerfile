FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y install epel-release
RUN yum -y install opensmtpd supervisor ; yum clean all

RUN /bin/echo -e 'listen on 0.0.0.0\naccept from any for any relay' > /etc/opensmtpd/smtpd.conf

COPY supervisord.ini /etc/supervisord.d/

EXPOSE 25

CMD ["/usr/bin/supervisord"]
