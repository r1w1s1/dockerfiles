FROM centos:7

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

###Salt Installation
RUN curl -s -L https://bootstrap.saltstack.com -o - | sh -s -- -M -X -D

RUN yum -y install bind-utils dmidecode supervisor ; yum clean all

#Allow Salt-master access ANY minion (for test only)
RUN sed -i "s/#auto_accept: False/auto_accept: True/g" /etc/salt/master

#Setting minion configuration
RUN sed -i "s/#master:.*/master: localhost/g" /etc/salt/minion

###SSH Installation
RUN yum -y install openssh-server passwd supervisor ; yum clean all

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN echo 'root:root' | chpasswd

COPY supervisord.ini /etc/supervisord.d/

EXPOSE 22 4505 4506

CMD ["/usr/bin/supervisord"]
