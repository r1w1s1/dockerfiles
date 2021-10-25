# DESCRIPTION:   Node 14 container
# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Build Node 14 based on Ubuntu 20.04
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/node-14/Dockerfile
#
#    # Build ruby image
#    docker build -t node-14-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it node-14-ubuntu:20.04
#
#
FROM ubuntu:20.04

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
	  apt-get install -y --no-install-recommends \
    gpg \
    dirmngr \
    curl \
    ca-certificates \
    xz-utils

ENV NODE_VERSION 14.16.1
ENV ARCH x64

RUN set -ex \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  # smoke tests
  && node --version \
  && npm --version

ENV YARN_VERSION 1.22.5

RUN curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz \
  # smoke test
  && yarn --version

FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
	  apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf /var/cache/apt/archives/*

COPY --from=0 /usr/local/ /usr/local/
COPY --from=0 /opt /opt

CMD [ "node" ]