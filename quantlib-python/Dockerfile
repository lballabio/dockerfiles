ARG tag=latest
FROM lballabio/quantlib:${tag} AS builder

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG quantlib_swig_version

RUN wget https://dl.bintray.com/quantlib/releases/QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && tar xfz QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && rm QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && cd QuantLib-SWIG-${quantlib_swig_version} \
    && ./configure CXXFLAGS='-g0 -O3' \
    && make -C Python && make -C Python check && make -C Python install \
    && cd .. && rm -rf QuantLib-SWIG-${quantlib_swig_version}


FROM ubuntu:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="An environment with the QuantLib Python module"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV quantlib_swig_version ${quantlib_swig_version}

COPY --from=builder /usr/lib/libQuantLib.la /usr/lib/
COPY --from=builder /usr/lib/libQuantLib.so.0.0.0 /usr/lib/
RUN cd /usr/lib && ln -s libQuantLib.so.0.0.0 libQuantLib.so.0
RUN cd /usr/lib && ln -s libQuantLib.so.0.0.0 libQuantLib.so
RUN ldconfig

COPY --from=builder /usr/local/lib/python2.7/dist-packages/QuantLib \
                    /usr/local/lib/python2.7/dist-packages/QuantLib
COPY --from=builder /usr/local/lib/python2.7/dist-packages/QuantLib*.egg-info \
                    /usr/local/lib/python2.7/dist-packages/

CMD python

