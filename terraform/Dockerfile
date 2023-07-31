# DESCRIPTION:   Terraform container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com>
# COMMENTS:
#    Terraform build based on Almalinux 9 Micro
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/terraform/Dockerfile
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
FROM almalinux:9 as installer

ENV TERRAFORM_VERSION=1.5.4

RUN \
    dnf update \
    && dnf install -y zip \
    && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM almalinux/9-micro

COPY --from=0 /bin/terraform /bin/terraform

ENTRYPOINT ["/bin/terraform"]
