# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Apache 2.4 with PHP8 based on Almalinux 9
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/httpd-php80/Dockerfile
#
#    # Build image
#    docker build -t httpd-php80 .
#
#    # Run the image
#    docker run -p 80:80 -d httpd-php80 
#
#
FROM almalinux:9

COPY httpd-foreground /usr/local/bin/

RUN \
    dnf -y update \
    && dnf -y install \
    php \
    php-mysqlnd \
    mod_ssl \
    procps-ng \
    && mkdir /run/php-fpm \
    && chmod +x /usr/local/bin/httpd-foreground \
    && /usr/libexec/httpd-ssl-gencerts \
    && chmod 644 /etc/pki/tls/private/localhost.key \
    && sed -ri 's/#ServerName www.example.com:80/ServerName localhost:80/g' /etc/httpd/conf/httpd.conf \
    && sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf \
    && sed -ri -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
	       -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
	       /etc/httpd/conf/httpd.conf
            
COPY index.php /var/www/html

WORKDIR /var/www/html

EXPOSE 80

CMD ["httpd-foreground"]
