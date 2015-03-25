# sshd
#
# VERSION               0.0.1

FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y install openssh openssh-server openssh-clients sudo passwd sed supervisor ; yum clean all

RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN echo 'root:root' | chpasswd

COPY supervisord.ini /etc/supervisord.d/

EXPOSE 22

CMD ["/usr/bin/supervisord"]
