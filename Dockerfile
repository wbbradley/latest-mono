FROM debian:wheezy

MAINTAINER Will Bradley <williambbradley@gmail.com>

RUN apt-get update \
	&& apt-get install -y git autoconf libtool automake build-essential mono-devel gettext

ENV PREFIX /opt/mono
ENV PATH $PREFIX/bin:$PATH

RUN mkdir -p /opt/mono

RUN cd /opt/mono \
	&& git clone https://github.com/mono/mono.git src

RUN cd /opt/mono \
	&& If you run this much, to get the latest build, blow away the cache for this command and re-run 'make image' \
	&& git pull

RUN cd /opt/mono/src \
	&& ./autogen.sh --prefix=$PREFIX

RUN make
RUN make install

