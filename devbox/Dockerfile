ARG tag=latest
FROM lballabio/boost:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A development environment for building QuantLib and its SWIG bindings"

RUN apt-get update && apt-get install -y autoconf automake libtool ccache \
                                         git cmake libpcre3-dev python-dev

RUN mv /usr/lib/ccache/* /usr/local/bin

ENV swig_version=3.0.10

RUN wget http://downloads.sourceforge.net/project/swig/swig/swig-${swig_version}/swig-${swig_version}.tar.gz \
    && tar xfz swig-${swig_version}.tar.gz \
    && rm swig-${swig_version}.tar.gz \
    && cd swig-${swig_version} \
    && ./configure --prefix=/usr \
    && make -j 4 && make install \
    && cd .. && rm -rf swig-${swig_version}

CMD bash

