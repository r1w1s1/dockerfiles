FROM alpine:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN apk --no-cache add \
	ca-certificates \
        groff \
	py2-pip \
	&& pip install awscli

ENTRYPOINT [ "aws" ]
