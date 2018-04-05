FROM alpine:3.7 

MAINTAINER Ricardson Williams <ricardsonwilliams@gmail.com>

RUN \
	apk --no-cache add \
	caddy \
        php7-fpm

VOLUME /srv
WORKDIR /srv

ADD Caddyfile /etc/Caddyfile
ADD index.php /srv/index.php

EXPOSE 80

ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
