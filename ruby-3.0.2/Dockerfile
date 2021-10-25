# DESCRIPTION:   Ruby 3.0.2 container
# AUTHOR:        https://github.com/r1w1s1
# COMMENTS:
#    Build Ruby 3.0.2 based on Ubuntu 20.04
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/ruby-3.0.2/Dockerfile
#
#    # Build ruby image
#    docker build -t ruby-3.0.2-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it ruby-3.0.2-ubuntu:20.04
#
#
FROM ubuntu:20.04

ENV RUBY_MAJOR 3.0
ENV RUBY_VERSION 3.0.2
ENV RUBYGEMS_VERSION 3.2.29
ENV BUNDLER_VERSION 2.2.29

RUN \
    mkdir -p /usr/local/etc \
    && { \
	echo 'install: --no-document'; \
	echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

RUN \
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
	apt-get install -y --no-install-recommends \
    ca-certificates \
	autoconf \
    automake \
	bzip2 \
	dpkg-dev \
	file \
	g++ \
	gcc \
	imagemagick \
	libbz2-dev \
	libc6-dev \
	libcurl4-openssl-dev \
	libdb-dev \
	libevent-dev \
	libffi-dev \
	libgdbm-dev \
	libglib2.0-dev \
	libgmp-dev \
	libjpeg-dev \
	libkrb5-dev \
	liblzma-dev \
	libmagickcore-dev \
	libmagickwand-dev \
	libmaxminddb-dev \
	libncurses5-dev \
	libncursesw5-dev \
	libpng-dev \
	libpq-dev \
	libreadline-dev \
	libsqlite3-dev \
	libssl-dev \
	libtool \
	libwebp-dev \
	libxml2-dev \
	libxslt-dev \
	libyaml-dev \
	make \
	patch \
	unzip \
	xz-utils \
	zlib1g-dev \
    wget \
    && wget https://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz \
    && tar xzf ruby-$RUBY_VERSION.tar.gz -C /usr/src \
    && cd /usr/src/ruby-$RUBY_VERSION \
    && CFLAGS="-O3 -fPIC -fno-strict-aliasing" ./configure --disable-install-doc --enable-shared --enable-pthread \
    && make \
    && make install \
    && cd / \
    && rm -rf /usr/src/ruby-$RUBY_VERSION \
    && rm -rf /ruby-$RUBY_VERSION.tar.gz \
    && gem update --system "$RUBYGEMS_VERSION" \
    && gem install bundler --version "$BUNDLER_VERSION" --force \
    && apt-get clean

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

RUN \
    mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
    && chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

FROM ubuntu:20.04

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH=$BUNDLE_BIN:$PATH

RUN \
    mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
    && chmod 777 "$GEM_HOME" "$BUNDLE_BIN" \
    && apt-get update \
    && apt-get install -y libyaml-0.2 \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf /var/cache/apt/archives/*

COPY --from=0 /usr/local/ /usr/local/

CMD ["irb"]
