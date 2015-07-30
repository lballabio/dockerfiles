FROM lballabio/quantlib
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="An environment with the QuantLib Python module"

ENV version=1.6

RUN apt-get update && apt-get install -y python-dev
RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${version}/other\ languages/QuantLib-SWIG-${version}.tar.gz \
    && tar xfz QuantLib-SWIG-${version}.tar.gz \
    && rm QuantLib-SWIG-${version}.tar.gz \
    && cd QuantLib-SWIG-${version} \
    && ./configure --disable-perl --disable-ruby --disable-mzscheme --disable-guile --disable-csharp --disable-ocaml --disable-r --disable-java CXXFLAGS=-O2 \
    && make && make install \
    && cd .. && rm -rf QuantLib-SWIG-${version}

