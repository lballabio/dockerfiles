FROM lballabio/boost:1.58.0-trusty
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A building environment where the QuantLib C++ library is available"

ENV version=1.6

RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${version}/QuantLib-${version}.tar.gz \
    && tar xfz QuantLib-${version}.tar.gz \
    && rm QuantLib-${version}.tar.gz \
    && cd QuantLib-${version} \
    && ./configure --prefix=/usr CXXFLAGS=-O2 \
    && make -j 4 && make install \
    && cd .. && rm -rf QuantLib-${version} && ldconfig

