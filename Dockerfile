ARG JDK_VERSION=17

FROM eclipse-temurin:$JDK_VERSION

ARG HAXALL_DL_URL=https://github.com/haxall/haxall/releases/download/
ARG HAXALL_VERSION=3.1.8

WORKDIR /opt

RUN set -e; \
    HAXALL_BIN_URL="$HAXALL_DL_URL/v$HAXALL_VERSION/haxall-$HAXALL_VERSION.zip" && \
    # Install curl
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -q update && \
    apt-get -q install -y curl zip && \
    rm -rf /var/lib/apt/lists/* && \
    # Download Haxall
    curl -fsSL "$HAXALL_BIN_URL" -o haxall_download.zip && \
    unzip haxall_download.zip -d haxall_download && \
    mv haxall_download/haxall-$HAXALL_VERSION haxall && \
    rm -rf haxall_download && rm -f haxall_download.zip

WORKDIR /opt/haxall

COPY hx_start bin/
RUN chmod +x bin/*
ENV PATH $PATH:/opt/haxall/bin
RUN hx version

VOLUME /opt/haxall/proj/
ENTRYPOINT hx_start