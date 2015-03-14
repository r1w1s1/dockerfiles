FROM debian:jessie

MAINTAINER Johannes 'fish' Ziemke <docker@freigeist.org> @discordianfish

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qy update && apt-get -qy install opensmtpd
RUN /bin/echo -e 'listen on 0.0.0.0\naccept from any for any relay' > /etc/smtpd.conf
EXPOSE 25
ENTRYPOINT [ "smtpd", "-d" ]
