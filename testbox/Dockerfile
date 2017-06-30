ARG tag=latest
FROM lballabio/boost:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A testing environment for building QuantLib and its SWIG bindings"

RUN apt-get update && apt-get install -y clang \
                                         python-dev \
                                         python3-dev \
                                         ruby-dev \
                                         mono-devel \
                                         r-base-dev texlive \
                                         default-jdk

CMD bash

