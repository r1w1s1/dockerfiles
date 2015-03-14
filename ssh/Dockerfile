# sshd
#
# VERSION               0.0.1

FROM centos:latest
MAINTAINER Ricardson Williams <ricardsonwilliams@gmail.com>

RUN yum install openssh openssh-server openssh-clients sudo passwd sed -y
RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN echo 'root:root' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]