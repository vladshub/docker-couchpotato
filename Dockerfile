FROM python:2.7.10
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

ENV COUCHPOTATO_VERSION "build/3.0.1"
ENV PYTHONIOENCODING "UTF-8"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install python-lxml -y
RUN pip install --upgrade pip && pip install --upgrade pyopenssl

RUN curl -L "https://github.com/RuudBurger/CouchPotatoServer/archive/$COUCHPOTATO_VERSION.tar.gz" | tar xz && \
 mv CouchPotatoServer-* /couchpotatoserver 

WORKDIR /couchpotatoserver

EXPOSE 5050

CMD ["python", "/couchpotatoserver/CouchPotato.py", "--console_log", "--data_dir=/data", "--config_file=/config/couchpota.ini"]
