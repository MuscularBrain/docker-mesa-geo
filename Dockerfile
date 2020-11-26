# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

# scipy/machine learning (tensorflow)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
# ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2020.2-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install libspatialindex-dev

# 3) install packages
COPY pip-requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/pip-requirements.txt

RUN git clone https://github.com/MuscularBrain/0527291751.git



# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
