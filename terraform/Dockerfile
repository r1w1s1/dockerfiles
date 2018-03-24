FROM alpine:latest
MAINTAINER "HashiCorp Terraform Team <terraform@hashicorp.com>"

ENV TERRAFORM_VERSION=0.11.5
ENV TERRAFORM_SHA256SUM=131c440263382c79c7f783b70ff35cd1d03eb31c44f7738d153d95a0b8436ac9

RUN apk --no-cache add --update \
    git \
    curl \
    openssh \
    && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENTRYPOINT ["/bin/terraform"]
