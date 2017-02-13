FROM ubuntu:16.10
MAINTAINER Yamir Encarnacion "yencarnacion@webninjapr.com"
RUN apt-get -qq update
RUN apt-get install -y curl git-core libsnappy-dev autoconf automake libtool pkg-config
RUN (mkdir /opt/apps)
RUN (cd /opt/apps/ && git clone https://github.com/openvenues/libpostal)
WORKDIR /opt/apps/libpostal
RUN (cd /opt/apps/libpostal && ./bootstrap.sh)
RUN (mkdir /opt/apps/libpostal/data2)
RUN (cd /opt/apps/libpostal && ./configure --datadir=/opt/apps/libpostal/data2)
RUN (cd /opt/apps/libpostal && make)
RUN (cd /opt/apps/libpostal && make install)
RUN ldconfig
COPY ./src/simple_parse.c /opt/apps/libpostal/src/simple_parse.c
COPY ./src/simple_parse.sh /opt/apps/libpostal/src/simple_parse.sh
WORKDIR /opt/apps/libpostal/src
RUN (/bin/bash /opt/apps/libpostal/src/simple_parse.sh)

ENTRYPOINT [ "/opt/apps/libpostal/src/simple_parse" ]

