
.PHONY: all boost quantlib quantlib-python quantlib-python3 quantlib-jupyter testbox devbox quantlib-devenv

TAG:=latest

all: quantlib quantlib-python3 quantlib-jupyter

quantlib-jupyter:
	cd quantlib-jupyter && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-jupyter:$(TAG) .

quantlib-python:
	cd quantlib-python && docker build --build-arg tag=$(TAG) \
                                       --build-arg quantlib_swig_version=$(QL_SWIG_VERSION) \
                                       -t lballabio/quantlib-python:$(TAG) .

quantlib-python3:
	cd quantlib-python3 && docker build --build-arg tag=$(TAG) \
                                        --build-arg quantlib_swig_version=$(QL_SWIG_VERSION) \
                                        -t lballabio/quantlib-python3:$(TAG) .

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

