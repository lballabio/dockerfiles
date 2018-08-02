ARG tag=latest
FROM lballabio/quantlib-python3:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A Jupyter notebook server with the QuantLib Python module available"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget python3-distutils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py \
 && rm get-pip.py

RUN pip install --no-cache-dir jupyter matplotlib numpy scipy pandas

EXPOSE 8888

RUN mkdir /notebooks
VOLUME /notebooks
COPY *.ipynb /notebooks/

CMD jupyter notebook --no-browser --allow-root --ip=0.0.0.0 --port=8888 --notebook-dir=/notebooks

