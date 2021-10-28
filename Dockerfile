FROM python:3.7-alpine
MAINTAINER Opeyemi Ajala

ENV PYTHONUNBUFFERED 1

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add jpeg-dev zlib-dev libjpeg \
    && pip install Pillow==8.2.0 \
    && apk del build-deps
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt
 
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user