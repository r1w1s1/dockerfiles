FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN yum -y epel-release ; yum clean all
RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd supervisor ; yum clean all

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/ss

RUN echo 'root:root' | chpasswd

COPY supervisord.ini /etc/supervisord.d/

EXPOSE 22

CMD ["/usr/bin/supervisord"]
