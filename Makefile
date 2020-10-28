
.PHONY: all boost quantlib-devenv quantlib-swig-devenv quantlib-jupyter

TAG:=latest

all:

boost:
	cd boost && docker build --build-arg tag=$(TAG) \
	                         --build-arg boost_version=$(BOOST_VERSION) \
	                         --build-arg boost_dir=boost_$(subst .,_,$(BOOST_VERSION)) \
	                         -t lballabio/boost:$(TAG) .

quantlib-devenv:
	cd quantlib-devenv && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-devenv:$(TAG) .

quantlib-swig-devenv:
	cd quantlib-swig-devenv && docker build -f Dockerfile.base --build-arg tag=$(TAG) -t lballabio/quantlib-swig-devenv:base . \
	                        && docker build -f Dockerfile.default -t lballabio/quantlib-swig-devenv:default . \
	                        && docker build -f Dockerfile.threadsafe -t lballabio/quantlib-swig-devenv:threadsafe . \
	                        && docker build -f Dockerfile.python2 -t lballabio/quantlib-swig-devenv:python2 . \
	                        && docker build -f Dockerfile.python3 -t lballabio/quantlib-swig-devenv:python3 . \
	                        && docker build -f Dockerfile.csharp -t lballabio/quantlib-swig-devenv:csharp . \
	                        && docker build -f Dockerfile.java -t lballabio/quantlib-swig-devenv:java . \
	                        && docker build -f Dockerfile.r -t lballabio/quantlib-swig-devenv:r . \
				&& docker build -f Dockerfile.scala -t lballabio/quantlib-swig-devenv:scala .

quantlib-jupyter:
	cd quantlib-jupyter && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-jupyter:$(TAG) .
