FROM ubuntu
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="Provide a building environment where the Boost C++ libraries are available"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential wget libbz2-dev

ENV boost_version=1.59.0 boost_dir=boost_1_59_0

RUN wget http://downloads.sourceforge.net/project/boost/boost/${boost_version}/${boost_dir}.tar.gz \
    && tar xfz ${boost_dir}.tar.gz \
    && rm ${boost_dir}.tar.gz \
    && cd ${boost_dir} \
    && ./bootstrap.sh \
    && ./b2 --prefix=/usr -j 4 link=shared runtime-link=shared install \
    && cd .. && rm -rf ${boost_dir} && ldconfig

CMD bash

