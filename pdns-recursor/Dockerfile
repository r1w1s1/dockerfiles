FROM alpine:latest
RUN \
    apk --no-cache add \
    pdns-recursor
ADD recursor.conf /etc/pdns/recursor.conf
EXPOSE 53/udp
EXPOSE 53/tcp
ENTRYPOINT ["/usr/sbin/pdns_recursor"]
##CMD ["--export-etc-hosts=yes","--daemon=no","log-common-errors=3","--local-address=0.0.0.0","--local-port=53"]
