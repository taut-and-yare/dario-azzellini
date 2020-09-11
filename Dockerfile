FROM python:3.7

RUN apt-get -qq update && apt-get install -y jpegoptim optipng

ADD . /project
WORKDIR /project

RUN pip install --upgrade pip pip-tools
RUN pip-compile --rebuild --output-file requirements.txt requirements.in
RUN pip install -r requirements.txt
