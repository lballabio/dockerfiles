FROM lballabio/boost
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A development environment for building QuantLib and its SWIG bindings"

RUN apt-get update && apt-get install -y autoconf automake libtool \
                                         libpcre3-dev python-dev \
                                         ipython-notebook python-matplotlib python-pandas

ENV swig_version=3.0.7

RUN wget http://downloads.sourceforge.net/project/swig/swig/swig-${swig_version}/swig-${swig_version}.tar.gz \
    && tar xfz swig-${swig_version}.tar.gz \
    && rm swig-${swig_version}.tar.gz \
    && cd swig-${swig_version} \
    && ./configure --prefix=/usr \
    && make -j 4 && make install \
    && cd .. && rm -rf swig-${swig_version}

