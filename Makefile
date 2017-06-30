
.PHONY: boost quantlib quantlib-python quantlib-notebook testbox devbox

TAG:=latest

quantlib-notebook: quantlib-python
	cd quantlib-notebook && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-notebook:$(TAG) .

quantlib-python: quantlib
	cd quantlib-python && docker build --build-arg tag=$(TAG) -t lballabio/quantlib-python:$(TAG) .

quantlib:
	cd quantlib && docker build --build-arg tag=$(TAG) -t lballabio/quantlib:$(TAG) .

boost:
	cd boost && docker build --build-arg tag=$(TAG) -t lballabio/boost:$(TAG) .

testbox:
	cd testbox && docker build --build-arg tag=$(TAG) -t testbox:$(TAG) .

devbox:
	cd devbox && docker build --build-arg tag=$(TAG) -t devbox:$(TAG) .

