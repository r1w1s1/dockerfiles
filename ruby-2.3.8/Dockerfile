# DESCRIPTION:   Ruby 2.3.8 container
# AUTHOR:        https://github.com/r1williams
# COMMENTS:
#    Build Ruby 2.3.8 based on Ubuntu 20.04
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/ricardson/dockerfiles/master/ruby-2.3.8/Dockerfile
#
#    # Build ruby image
#    docker build -t ruby-2.3.8-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it ruby-2.3.8-ubuntu:20.04
#
#    # Use without build image
#    docker pull docker.pkg.github.com/r1williams/dockerfiles/ruby-2.3.8-ubuntu:20.04
#
#    # Use as base image in DockerFile:
#    FROM docker.pkg.github.com/r1williams/dockerfiles/ruby-2.3.8-ubuntu:20.04
#   
FROM ubuntu:20.04

# skip installing gem documentation
RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

ENV RUBY_MAJOR 2.3
ENV RUBY_VERSION 2.3.8
ENV RUBY_DOWNLOAD_SHA256 910f635d84fd0d81ac9bdee0731279e6026cb4cd1315bbbb5dfb22e09c5c1dfe
ENV RUBYGEMS_VERSION 3.1.4
ENV BUNDLER_VERSION 2.1.4

# some of ruby's build scripts are written in ruby
#   we purge system ruby later to make sure our final image uses what we just built
RUN set -ex \
	\
	&& buildDeps=" \
		bison \
		dpkg-dev \
		libgdbm-dev \
		# Old ruby isn't compatible with OpenSSL 1.1
		apt-utils \
		wget \
		autoconf \
		gcc \
		ruby \
		zlib1g \
		zlib1g-dev \
		libssl1.0-dev \
	" \
	&& apt-get update \
	&& apt-get install -y software-properties-common \
	&& apt-add-repository 'deb http://security.ubuntu.com/ubuntu bionic-security main' \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& rm -rf /var/lib/apt/lists/* \
	\
	&& wget -O ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
	&& echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.xz" | sha256sum -c - \
	\
	&& mkdir -p /usr/src/ruby \
	&& tar -xJf ruby.tar.xz -C /usr/src/ruby --strip-components=1 \
	&& rm ruby.tar.xz \
	\
	&& cd /usr/src/ruby \
	\
# hack in "ENABLE_PATH_CHECK" disabling to suppress:
#   warning: Insecure world writable dir
	&& { \
		echo '#define ENABLE_PATH_CHECK 0'; \
		echo; \
		cat file.c; \
	} > file.c.new \
	&& mv file.c.new file.c \
	\
	&& autoconf \
	&& gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
	&& ./configure \
		--build="$gnuArch" \
		--disable-install-doc \
		--enable-shared \
	&& make -j "$(nproc)" \
	&& make install \
	&& cd / \
	&& rm -r /usr/src/ruby \
	\
	&& gem update --system "$RUBYGEMS_VERSION"

ENV BUNDLER_VERSION 2.1.4

RUN gem install bundler --default --force --version "$BUNDLER_VERSION"

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_BIN="$GEM_HOME/bin" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH
RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
	&& chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

FROM ubuntu:20.04

ENV GEM_HOME /usr/local/bundle
ENV RUBY_MAJOR=2.3 \
    RUBY_VERSION=2.3.8 \
    RUBYGEMS_VERSION=3.1.4 \
    BUNDLER_VERSION=2.1.4 \
    BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH=$BUNDLE_BIN:$PATH

RUN \
    echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y \
	libssl1.0-dev \
	ca-certificates \
	libyaml-0.2 \
    && mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
    && chmod 777 "$GEM_HOME" "$BUNDLE_BIN" \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf /var/cache/apt/archives/*

COPY --from=0 /usr/local/ /usr/local/

CMD ["irb"]
