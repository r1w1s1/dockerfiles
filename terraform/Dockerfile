FROM alpine:latest
MAINTAINER "HashiCorp Terraform Team <terraform@hashicorp.com>"

ENV TERRAFORM_VERSION=0.11.4
ENV TERRAFORM_SHA256SUM=817be651ca41b999c09250a9fcade541a941afab41c0c663bd25529a4d5cfd31

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
