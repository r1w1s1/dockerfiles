FROM alpine:3.7 

MAINTAINER Ricardson Williams <ricardsonwilliams@gmail.com>

RUN \
	apk --no-cache add \
	apache2 \
        openssh \
	php5 \
        php5-intl \
        php5-mysql \
        php5-xml \
        php5-gd \
        php5-mcrypt \
        php5-pdo \
        php5-cli \
        php5-opcache \
        php5-soap \
        && mkdir -p /run/apache2 \
	&& sed -ri 's/#ServerName www.example.com:80/ServerName localhost:80/g' /etc/apache2/httpd.conf \
	&& sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/httpd.conf \
	&& sed -ri -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
		-e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
		/etc/apache2/httpd.conf \
	&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
	&& echo "root:root" | chpasswd

VOLUME /srv
WORKDIR /srv

ADD index.php /var/www/localhost/htdocs/index.php

EXPOSE 80

COPY scripts / 

ENTRYPOINT ["/entrypoint.sh"]
