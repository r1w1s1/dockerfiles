FROM alpine:latest 

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN \
    apk add --no-cache openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd

COPY scripts / 

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

