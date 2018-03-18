FROM alpine:latest
RUN apk --no-cache add \
	ca-certificates \
        groff \
	py2-pip \
	&& pip install awscli
ENTRYPOINT [ "aws" ]
