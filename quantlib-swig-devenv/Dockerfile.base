ARG tag=latest
FROM lballabio/boost:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A development environment for building QuantLib-SWIG on Travis CI"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake libtool \
                                                      libpcre3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV swig_version=4.0.0

RUN wget http://downloads.sourceforge.net/project/swig/swig/swig-${swig_version}/swig-${swig_version}.tar.gz \
 && tar xfz swig-${swig_version}.tar.gz \
 && rm swig-${swig_version}.tar.gz \
 && cd swig-${swig_version} \
 && ./configure --prefix=/usr \
 && make -j 4 && make install \
 && cd .. && rm -rf swig-${swig_version}

COPY QuantLib-*.tar.gz /tmp

RUN cd /tmp \
 && tar xfz QuantLib-*.tar.gz \
 && rm QuantLib-*.tar.gz \
 && cd QuantLib-* \
 && ./configure --enable-thread-safe-observer-pattern CXXFLAGS='-O3 -g0' \
 && make -j 4 && make install \
 && cd .. && rm -rf QuantLib-*

RUN ldconfig

CMD bash
