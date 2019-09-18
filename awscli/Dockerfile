# DESCRIPTION:   AWS CDK tool container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com.br>
# COMMENTS:
#    Build AWS CDK tool.
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/ricardson/dockerfiles/master/awscdk/Dockerfile
#
#    # Build ruby image
#    docker build -t awscdk .
#
#    # Run the image
#    docker run -it awscdk
#
#

FROM alpine:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN apk --no-cache add \
	ca-certificates \
        groff \
	py2-pip \
	&& pip install awscli

ENTRYPOINT [ "aws" ]
