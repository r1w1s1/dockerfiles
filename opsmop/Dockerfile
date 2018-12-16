FROM python:alpine
MAINTAINER "Ricardson Williams <ricardsonwilliams@gmail.com>"

RUN apk --no-cache add --update \
    git \
    make

RUN \
    git clone https://github.com/opsmop/opsmop-demo.git \
    && git clone https://github.com/opsmop/opsmop.git \
    && cd opsmop \
    && make requirements \
    && pip install git+https://github.com/opsmop/opsmop.git@master