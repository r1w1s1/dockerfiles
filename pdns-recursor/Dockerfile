FROM alpine:latest

MAINTAINER Ricardson Williams <ricardsonwilliams@gmail.com>

RUN \
    apk --no-cache add \
    pdns-recursor

ADD recursor.conf /etc/pdns/recursor.conf

EXPOSE 53/udp
EXPOSE 53/tcp

ENTRYPOINT ["/usr/sbin/pdns_recursor"]
