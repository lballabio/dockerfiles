FROM lballabio/boost:1.57.0-trusty
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A building environment where the QuantLib C++ library is available"

ENV version=1.5

RUN apt-get update && apt-get install -y automake autoconf libtool
RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${version}/QuantLib-${version}.tar.gz \
    && tar xfz QuantLib-${version}.tar.gz \
    && rm QuantLib-${version}.tar.gz
RUN cd QuantLib-${version} \
    && ./autogen.sh \
    && ./configure --prefix=/usr CXXFLAGS=-O2 \
    && make && make install \
    && cd .. && rm -rf QuantLib-${version} && ldconfig

