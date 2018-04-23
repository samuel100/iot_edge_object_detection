FROM ubuntu:xenial

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcurl4-openssl-dev python-pip libboost-python-dev && \
    rm -rf /var/lib/apt/lists/* 

RUN apt-get update && \
    apt-get install python-opencv -y --allow-unauthenticated && \
    apt-get install -y python-setuptools


COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "-u", "./main.py" ]