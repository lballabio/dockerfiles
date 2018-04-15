
.PHONY: all boost quantlib quantlib-python quantlib-notebook quantlib-jupyter testbox devbox quantlib-devenv

TAG:=latest

all: quantlib quantlib-python quantlib-notebook quantlib-jupyter

quantlib-notebook:
	cd quantlib-notebook && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-notebook:$(TAG) .

quantlib-jupyter:
	cd quantlib-jupyter && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-jupyter:$(TAG) .

quantlib-python:
	cd quantlib-python && docker build --build-arg tag=$(TAG) \
                                       --build-arg quantlib_swig_version=$(QL_SWIG_VERSION) \
                                       -t lballabio/quantlib-python:$(TAG) .

quantlib:
	cd quantlib && docker build --build-arg tag=$(TAG) \
                                --build-arg quantlib_version=$(QL_VERSION) \
                                -t lballabio/quantlib:$(TAG) .

boost:
	cd boost && docker build --build-arg tag=$(TAG) \
	                         --build-arg boost_version=$(BOOST_VERSION) \
	                         --build-arg boost_dir=boost_$(subst .,_,$(BOOST_VERSION)) \
	                         -t lballabio/boost:$(TAG) .

testbox:
	cd testbox && docker build --build-arg tag=$(TAG) -t testbox:$(TAG) .

devbox:
	cd devbox && docker build --build-arg tag=$(TAG) -t devbox:$(TAG) .

quantlib-devenv:
	cd quantlib-devenv && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-devenv:$(TAG) .

