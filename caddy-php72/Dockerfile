FROM alpine:edge

MAINTAINER Ricardson Williams <ricardsonwilliams@gmail.com>

RUN \
	apk --no-cache add \
	caddy \
        php7-fpm \
        php7-intl \
        php7-openssl \
        php7-dba \
        php7-sqlite3 \
        php7-pear \
        php7-tokenizer \
        php7-phpdbg \
        php7-litespeed \
        php7-gmp \
        php7-pdo_mysql \
        php7-pcntl \
        php7-common \
        php7-oauth \
        php7-xsl \
        php7-imagick \
        php7-mysqlnd \
        php7-enchant \
        php7-pspell \
        php7-redis \
        php7-snmp \
        php7-doc \
        php7-fileinfo \
        php7-mbstring \
        php7-pear-mail_mime \
        php7-xmlrpc \
        php7-embed \
        php7-xmlreader \
        php7-pear-mdb2_driver_mysql \
        php7-pdo_sqlite \
        php7-pear-auth_sasl \
        php7-exif \
        php7-recode \
        php7-opcache \
        php7-ldap \
        php7-posix \
        php7-pear-net_socket \
        php7-session \
        php7-gd \
        php7-gettext \
        php7-mailparse \
        php7-json \
        php7-xml \
        php7-iconv \
        php7-sysvshm \
        php7-curl \
        php7-shmop \
        php7-odbc \
        php7-phar \
        php7-pdo_pgsql \
        php7-imap \
        php7-pear-mdb2_driver_pgsql \
        php7-pdo_dblib \
        php7-pgsql \
        php7-pdo_odbc \
        php7-xdebug \
        php7-zip \
        php7-cgi \
        php7-ctype \
        php7-amqp \
        php7-mcrypt \
        php7-wddx \
        php7-pear-net_smtp \
        php7-bcmath \
        php7-calendar \
        php7-tidy \
        php7-dom \
        php7-sockets \
        php7-zmq \
        php7-memcached \
        php7-soap \
        php7-apcu \
        php7-sysvmsg \
        php7-imagick-dev \
        php7-ssh2 \
        php7-ftp \
        php7-sysvsem \
        php7-pear-net_idna2 \
        php7-pdo \
        php7-pear-auth_sasl \
        php7-bz2 \
        php7-mysqli \
        php7-pear-net_smtp-doc \
        php7-simplexml \
        php7-xmlwriter 

VOLUME /srv
WORKDIR /srv

ADD Caddyfile /etc/Caddyfile
ADD index.php /srv/index.php

EXPOSE 80

ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
