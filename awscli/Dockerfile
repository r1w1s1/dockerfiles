# DESCRIPTION:   AWS CLI container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com.br>
# COMMENTS:
#    Build AWS CLI.
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/ricardson/dockerfiles/master/awscli/Dockerfile
#
#    # Build ruby image
#    docker build -t awscli .
#
#    # Run the image
#    docker run -rm \
#               -it \
#               -v ${PWD}/.aws:/root/.aws \
#               awscli
#
#    # Test image
#    docker run -it \
#               -v ${PWD}/.aws:/root/.aws \
#               awscli sts get-caller-identity
#
#    
#    #Add to .bashrc
#    alias aws='sudo docker run -it -v ${PWD}/.aws:/root/.aws awscli'
#
FROM alpine:latest

MAINTAINER Ricardson 'rwcs' Williams <ricardsonwilliams@gmail.com>

RUN apk --no-cache add \
	ca-certificates \
        groff \
	py2-pip \
	&& pip install awscli

ENTRYPOINT [ "aws" ]
