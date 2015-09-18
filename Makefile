
.PHONY: boost quantlib quantlib-python quantlib-notebook testbox devbox

quantlib-notebook: quantlib-python
	cd quantlib-notebook && docker build -t lballabio/quantlib-notebook .

quantlib-python: quantlib
	cd quantlib-python && docker build -t lballabio/quantlib-python .

quantlib: boost
	cd quantlib && docker build -t lballabio/quantlib .

boost:
	cd boost && docker build -t lballabio/boost .

testbox: boost
	cd testbox && docker build -t testbox .

devbox: boost
	cd devbox && docker build -t devbox .

