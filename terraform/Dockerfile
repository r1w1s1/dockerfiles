# DESCRIPTION:   Terraform container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com.br>
# COMMENTS:
#    Terraform build based on Ubuntu 20.04 LTS
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/ricardson/dockerfiles/master/terraform/Dockerfile
#
#    # Build image
#    docker build -t terraform .
#
#    # Run the image
#    docker run -it terraform .
#
#    # Add into .bashrc
#    alias terraform='sudo docker run -it terraform'
#
FROM ubuntu:20.04 as installer

ENV TERRAFORM_VERSION=1.0.9

RUN \
    apt-get update \
    && apt-get install -y apt-utils curl zip \
    && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM ubuntu:20.04

COPY --from=0 /bin/terraform /bin/terraform

ENTRYPOINT ["/bin/terraform"]
