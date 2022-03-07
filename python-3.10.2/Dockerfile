# DESCRIPTION:   Python 3.10.2 container
# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Python 3.10.2 based on Ubuntu 20.04
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/python-3.10.2/Dockerfile
#
#    # Build ruby image
#    docker build -t python-3.10.2-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it python-3.10.2-ubuntu:20.04
#
#
FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ focal main" >> /etc/apt/sources.list \
    && apt update \
    && apt -y build-dep python3 \
    && apt -y install curl gdb lcov libbz2-dev libffi-dev libgdbm-dev \
       libgdbm-compat-dev liblzma-dev libncurses5-dev libreadline6-dev \
       libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev \
    && curl -o /root/Python-3.10.2.tgz https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz \
    && cd /root \
    && tar xzf Python-3.10.2.tgz \
    && cd Python-3.10.2 \
    && ./configure --enable-optimizations \
    && make altinstall \
    && ln -s /usr/local/bin/python3.10 /usr/bin \
    && ln -s /usr/local/bin/pip3.10 /usr/bin

FROM ubuntu:20.04

COPY --from=builder /usr/local/ /usr/local/

RUN ln -s /usr/local/bin/python3.10 /usr/bin/python3 \
    && ln -s /usr/local/bin/pip3.10 /usr/bin/pip3

CMD ["python3"]