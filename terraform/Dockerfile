# DESCRIPTION:   Terraform container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com.br>
# COMMENTS:
#    Terraform build based on Amazon Linux 2 LTS (https://aws.amazon.com/amazon-linux-2/)
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
FROM amazonlinux:2

ENV TERRAFORM_VERSION=0.12.8

RUN \
    yum -y install unzip \
    && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

###Final Image###

FROM amazonlinux:2

COPY --from=0 /bin/terraform /bin/terraform

ENTRYPOINT ["/bin/terraform"]
