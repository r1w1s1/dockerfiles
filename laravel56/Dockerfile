FROM alpine:edge 

MAINTAINER Ricardson Williams <ricardsonwilliams@gmail.com>

RUN \
	apk --no-cache add \
	php7 \
        php7-dev \
        php7-zip \
        php7-pdo \
        php7-mbstring \
        php7-openssl \
        php7-tokenizer \
        php7-xml \
        php7-ctype \
        php7-json \
        php7-phar \
        php7-dom \
        php7-xmlwriter \
        php7-session \
        composer

RUN \
     composer create-project --prefer-dist laravel/laravel docker-laravel

VOLUME /srv
WORKDIR /srv

EXPOSE 8000

COPY scripts / 

ENTRYPOINT ["/entrypoint.sh"]
