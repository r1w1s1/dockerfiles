# DESCRIPTION:   Python 3.8.10 container
# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Python 3.8.xx based on Ubuntu 20.04
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/python-3.8/Dockerfile
#
#    # Build ruby image
#    docker build -t python-3.8-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it python-3.8-ubuntu:20.04
#
#
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && rm -rf /usr/share/doc/* \
  && rm -rf /usr/share/info/* \
  && rm -rf /var/cache/apt/archives/*


CMD ["python3"]