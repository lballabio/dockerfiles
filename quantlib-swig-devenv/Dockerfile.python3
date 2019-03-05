FROM lballabio/quantlib-swig-devenv:base
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A development environment for building QuantLib-SWIG on Travis CI"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

