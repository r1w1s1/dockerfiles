# DESCRIPTION:   aws-cli container
# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Build aws-cli based on Ubuntu 20.04
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1williams/dockerfiles/master/aws-cli/Dockerfile
#
#    # Build aws-cli image
#    docker build -t aws-cli .
#
#    # Run the image
#    docker run -it aws-cli
#
#
FROM ubuntu:20.04 as installer

RUN apt-get update \
    && apt-get install -y apt-utils curl zip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install --bin-dir /aws-cli-bin/

FROM ubuntu:20.04

COPY --from=installer /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=installer /aws-cli-bin/ /usr/local/bin/

WORKDIR /aws
ENTRYPOINT [ "/usr/local/bin/aws" ]
