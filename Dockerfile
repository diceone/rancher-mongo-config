FROM ubuntu:14.04
MAINTAINER Hussein Galal

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10\
&& echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list \
&& sudo apt-get install -y mongodb-org-shell=3.0.4 \
&& apt-get update \
&& apt-get install -yqq python python-pip python-setuptools
&& pip install pymongo

RUN mkdir -p /mongo
WORKDIR /mongo

ENV MONGO_SERVICE_NAME mongo
ADD mongo_rancher.py mongo_rancher.py

ENTRYPOINT ['python', 'mongo_rancher.py']