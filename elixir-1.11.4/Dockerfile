# DESCRIPTION:  Elixir 1.11.4 container
# AUTHOR:       https://github.com/r1w1s1
# COMMENTS:
#    Build Elixir 1.11.4 based on Ubuntu 20.04 LTS
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/elixir-1.11.4/Dockerfile
#
#    # Build ruby image
#    docker build -t elixir-1.11.4-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it elixir-1.11.4-ubuntu:20.04
#
#
FROM erlang-23-ubuntu2004

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.11.4" \
	LANG=C.UTF-8

RUN set -xe \
    && apt-get update \
    && apt-get -y install \
    curl \
    make \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION}.tar.gz" \
	&& ELIXIR_DOWNLOAD_SHA256="85c7118a0db6007507313db5bddf370216d9394ed7911fe80f21e2fbf7f54d29" \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean \
    && rm -rf /usr/local/src/elixir \
    && rm -rf /usr/share/doc 

CMD ["iex"]