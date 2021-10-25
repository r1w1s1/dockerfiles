# DESCRIPTION:  Erlang 23 container
# AUTHOR:       https://github.com/r1w1s1
# COMMENTS:
#    Build Erlang 23 based on Ubuntu 20.04 LTS
#
# USAGE:
#    # Download Dockerfile
#    wget https://raw.githubusercontent.com/r1w1s1/dockerfiles/master/erlang-23/Dockerfile
#
#    # Build ruby image
#    docker build -t erlang-23-ubuntu:20.04 .
#
#    # Run the image
#    docker run -it erlang-23-ubuntu:20.04
#
#
FROM ubuntu:20.04

ENV OTP_VERSION="23.3.1" \
    REBAR3_VERSION="3.14.4"

LABEL org.opencontainers.image.version=$OTP_VERSION

RUN set -xe \
    && apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get -y install --no-install-recommends \
	build-essential \
	ca-certificates \
	file \
	g++ \
	gcc \
	libcurl4-openssl-dev \
	libodbc1 \
	libsctp1 \
	libwxgtk3.0-gtk3-0v5 \
	unixodbc-dev \
	libsctp-dev \
	libwxgtk3.0-gtk3-dev \
	libncurses-dev \
	libncurses6 \
	curl \
	dpkg-dev \
	libssl-dev \
	libcrypto++-dev \
	ssh \
	java-common \
	xsltproc \
	libxml2-utils \
	&& OTP_DOWNLOAD_URL="https://github.com/erlang/otp/archive/OTP-${OTP_VERSION}.tar.gz" \
	&& OTP_DOWNLOAD_SHA256="a5a067a3b17bbef8511f2c056957925b666670b6f2cdaf645e1bc28ce3dd3517" \
	&& curl -fSL -o otp-src.tar.gz "$OTP_DOWNLOAD_URL" \
	&& echo "$OTP_DOWNLOAD_SHA256  otp-src.tar.gz" | sha256sum -c - \
	&& export ERL_TOP="/usr/src/otp_src_${OTP_VERSION%%@*}" \
	&& mkdir -vp $ERL_TOP \
	&& tar -xzf otp-src.tar.gz -C $ERL_TOP --strip-components=1 \
	&& rm otp-src.tar.gz \
	&& cd $ERL_TOP \
	&& ./otp_build autoconf \
	&& gnuArch="$(dpkg-architecture --query DEB_HOST_GNU_TYPE)" \
	&& ./configure --build="$gnuArch" \
	&& make -j$(nproc) \
	&& make -j$(nproc) docs DOC_TARGETS=chunks \
	&& make install install-docs DOC_TARGETS=chunks \
	&& find /usr/local -name examples | xargs rm -rf \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& rm -rf $ERL_TOP /var/lib/apt/lists/*

ENV REBAR_VERSION="2.6.4"

RUN set -xe \
	&& REBAR_DOWNLOAD_URL="https://github.com/rebar/rebar/archive/${REBAR_VERSION}.tar.gz" \
	&& REBAR_DOWNLOAD_SHA256="577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07" \
	&& mkdir -p /usr/src/rebar-src \
	&& curl -fSL -o rebar-src.tar.gz "$REBAR_DOWNLOAD_URL" \
	&& echo "$REBAR_DOWNLOAD_SHA256 rebar-src.tar.gz" | sha256sum -c - \
	&& tar -xzf rebar-src.tar.gz -C /usr/src/rebar-src --strip-components=1 \
	&& rm rebar-src.tar.gz \
	&& cd /usr/src/rebar-src \
	&& ./bootstrap \
	&& install -v ./rebar /usr/local/bin/ \
	&& rm -rf /usr/src/rebar-src

RUN set -xe \
	&& REBAR3_DOWNLOAD_URL="https://github.com/erlang/rebar3/archive/${REBAR3_VERSION}.tar.gz" \
	&& REBAR3_DOWNLOAD_SHA256="8d78ed53209682899d777ee9443b26b39c9bf96c8b081fe94b3dd6693077cb9a" \
	&& mkdir -p /usr/src/rebar3-src \
	&& curl -fSL -o rebar3-src.tar.gz "$REBAR3_DOWNLOAD_URL" \
	&& echo "$REBAR3_DOWNLOAD_SHA256 rebar3-src.tar.gz" | sha256sum -c - \
	&& tar -xzf rebar3-src.tar.gz -C /usr/src/rebar3-src --strip-components=1 \
	&& rm rebar3-src.tar.gz \
	&& cd /usr/src/rebar3-src \
	&& HOME=$PWD ./bootstrap \
	&& install -v ./rebar3 /usr/local/bin/ \
	&& rm -rf /usr/src/rebar3-src

FROM ubuntu:20.04

RUN \
    rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf /var/cache/apt/archives/*

COPY --from=0 /usr/local/ /usr/local/

CMD ["erl"]