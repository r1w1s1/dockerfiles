# DESCRIPTION:   Ruby 2.5.1 container
# AUTHOR:        Ricardson Williams <ricardsonwilliams@gmail.com.br>
# COMMENTS:
#    Build Ruby 2.5.1 based on Amazon Linux 2 LTS (https://aws.amazon.com/amazon-linux-2/)
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/ricardson/dockerfiles/master/ruby-2.5.1/Dockerfile
#
#    # Build ruby image
#    docker build -t ruby-2.5.1-amazonlinux .
#
#    # Run the image
#    docker run -it ruby-2.5.1-amazonlinux
#
#
FROM amazonlinux:2 

ENV RUBY_MAJOR 2.5
ENV RUBY_VERSION 2.5.1
ENV RUBYGEMS_VERSION 3.0.3
ENV BUNDLER_VERSION 2.0.1

RUN \
     mkdir -p /usr/local/etc \
     && { \
	  echo 'install: --no-document'; \
	  echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

RUN \
     yum -y groupinstall 'Development Tools' \
     && yum -y update \
     && yum -y install \
     libyaml-devel \
     openssl \
     openssl-devel \
     gdbm-devel \
     libffi-devel \
     gmp-devel \
     readline-devel \
     wget \
     && yum clean all \
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
     && yum clean all

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

RUN \
     mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
     && chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

###Final Image###

FROM amazonlinux:2

ENV RUBY_MAJOR 2.5 \
    RUBY_VERSION 2.5.1 \
    RUBYGEMS_VERSION 3.0.3 \
    BUNDLER_VERSION 2.0.1

ENV GEM_HOME /usr/local/bundle \
    BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME" \
    PATH $BUNDLE_BIN:$PATH

RUN \
    mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
    && chmod 777 "$GEM_HOME" "$BUNDLE_BIN" \
    && yum -y install libyaml \
    && yum clean all \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf rm -rf /var/cache/yum/* \
    && && cp /etc/skel/.bashrc /root/

COPY --from=0 /usr/local/ /usr/local/

CMD ["irb"]
