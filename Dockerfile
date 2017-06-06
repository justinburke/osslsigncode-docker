FROM ubuntu

# Essential build packages:
RUN apt update && \
    apt install -y \
        autoconf \
        build-essential \
        git \
        libtool \
        pkg-config

# Build packages more specific to osslsigncode:
RUN apt install -y \
        libcurl4-openssl-dev \
        libssl-dev

RUN git clone git://git.code.sf.net/p/osslsigncode/osslsigncode osslsigncode

# Compiled binary will be copied to /export/.
# Example: docker run -it -v /home/user/export/:/export osslsigncode
VOLUME /export

WORKDIR /osslsigncode
CMD ./autogen.sh && ./configure && make && cp osslsigncode /export

# vi:et
