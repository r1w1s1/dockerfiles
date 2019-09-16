FROM alpine:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN apk --no-cache add \
	ca-certificates \
        groff \
	nodejs \
	npm

RUN npm install -g aws-cdk

ENTRYPOINT [ "/usr/bin/cdk" ]
