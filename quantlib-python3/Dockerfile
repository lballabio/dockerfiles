ARG tag=latest
FROM lballabio/quantlib:${tag} AS builder

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG quantlib_swig_version

RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py \
 && rm get-pip.py

RUN wget https://dl.bintray.com/quantlib/releases/QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && tar xfz QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && rm QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && cd QuantLib-SWIG-${quantlib_swig_version}/Python \
    && CXXFLAGS='-g0 -O3' /usr/bin/python3 setup.py bdist_wheel


FROM ubuntu:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="An environment with the QuantLib Python module"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget python3 python3-distutils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py \
 && rm get-pip.py

ARG quantlib_swig_version
ENV quantlib_swig_version ${quantlib_swig_version}

COPY --from=builder /usr/lib/libQuantLib.la /usr/lib/
COPY --from=builder /usr/lib/libQuantLib.so.0.0.0 /usr/lib/
RUN cd /usr/lib && ln -s libQuantLib.so.0.0.0 libQuantLib.so.0
RUN cd /usr/lib && ln -s libQuantLib.so.0.0.0 libQuantLib.so
RUN ldconfig

COPY --from=builder /QuantLib-SWIG-${quantlib_swig_version}/Python/dist/QuantLib_Python*.whl /tmp

RUN pip install /tmp/QuantLib_Python*.whl

CMD python3

