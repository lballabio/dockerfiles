ARG tag=latest
FROM lballabio/quantlib:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="An environment with the QuantLib Python module"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG quantlib_swig_version=1.10
ENV quantlib_swig_version ${quantlib_swig_version}

RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${quantlib_swig_version}/other\ languages/QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && tar xfz QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && rm QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && cd QuantLib-SWIG-${quantlib_swig_version} \
    && ./configure --disable-perl --disable-ruby --disable-mzscheme --disable-guile --disable-csharp --disable-ocaml --disable-r --disable-java CXXFLAGS=-O3 \
    && make && make -C Python check && make install \
    && cd .. && rm -rf QuantLib-SWIG-${quantlib_swig_version}

CMD python

