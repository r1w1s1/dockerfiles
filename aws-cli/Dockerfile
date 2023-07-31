# DESCRIPTION:   aws-cli container
# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Build aws-cli based on Almalinux 9
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/aws-cli/Dockerfile
#
#    # Build aws-cli image
#    docker build -t aws-cli .
#
#    # Run the image
#    docker run -it aws-cli
#
#
FROM almalinux:9 as installer

RUN dnf update \
    && dnf install -y zip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install --bin-dir /aws-cli-bin/

FROM almalinux:9-minimal

RUN microdnf install -y less groff

COPY --from=installer /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=installer /aws-cli-bin/ /usr/local/bin/

WORKDIR /aws
ENTRYPOINT [ "/usr/local/bin/aws" ]
