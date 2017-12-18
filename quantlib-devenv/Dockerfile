ARG tag=latest
FROM lballabio/boost:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A development environment for building QuantLib on Travis CI"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake libtool ccache cmake clang \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

CMD bash

