FROM python:3.4.3

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV LANG en_US.UTF-8
ENV PYTHONIOENCODING utf_8

RUN mkdir /usr/src/app
ADD . /usr/src/app

RUN apt-get update -y
RUN apt-get install -y build-essential python python-dev python-setuptools libpq-dev libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev python-opencv python-numpy

WORKDIR /usr/src/app/wagtaildemo
RUN pip install -r requirements.txt

WORKDIR /usr/src/app/wagtail
RUN python setup.py develop
RUN pip install -r requirements-dev.txt
RUN pip install embedly elasticsearch django-sendfile
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN npm install && npm run build

WORKDIR ../libs/django-modelcluster
RUN python setup.py develop
WORKDIR ../Willow
RUN python setup.py develop

WORKDIR /usr/src/app
