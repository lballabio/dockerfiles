ARG tag=latest
FROM gbalaraman/quantlib-python3:${tag}
MAINTAINER Goutham Balaraman <gouthaman.balaraman@gmail.com>
LABEL Description="An IPython notebook server with the QuantLib Python module available"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3-matplotlib \
                                                      python3-pandas \
 && pip3 install --no-cache-dir jupyter \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

RUN mkdir /notebooks
VOLUME /notebooks
COPY *.ipynb /notebooks/

CMD jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --notebook-dir=/notebooks --allow-root

