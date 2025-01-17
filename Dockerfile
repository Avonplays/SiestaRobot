FROM debian:11
FROM python:3.10.1-slim-buster

WORKDIR /SiestaRobot/

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install git
RUN python3.9 -m pip install -U pip
RUN apt-get install -y wget python3-pip curl bash neofetch ffmpeg software-properties-common

COPY requirements.txt .

RUN pip3 install wheel
RUN pip3 install numpy
RUN pip3 install pendulum==2.1.2
RUN pip3 install -r requirements.txt
COPY . .
RUN pip3 install httpcore[http2]
RUN pip3 install httpcore==0.12.3
RUN pip3 install httpx==0.24.1

CMD python ambot.py
