ARG tag=latest
FROM python:${tag}
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A Jupyter notebook server with the QuantLib Python module available"

RUN pip install --no-cache-dir quantlib jupyter jupyterlab matplotlib numpy scipy pandas ipywidgets RISE

RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension install widgetsnbextension --py --sys-prefix \
 && jupyter-nbextension enable widgetsnbextension --py --sys-prefix

EXPOSE 8888

RUN mkdir /notebooks
VOLUME /notebooks
COPY *.ipynb /notebooks/

CMD jupyter notebook --no-browser --allow-root --ip=0.0.0.0 --port=8888 --notebook-dir=/notebooks

