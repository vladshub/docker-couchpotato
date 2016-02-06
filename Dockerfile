FROM vladshub/docker-python-virtualenv
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

ENV COUCHPOTATO_VERSION "build/3.0.1"
ENV PYTHONIOENCODING "UTF-8"

RUN curl -s -L "https://github.com/RuudBurger/CouchPotatoServer/archive/$COUCHPOTATO_VERSION.tar.gz" | tar xz \
  && mv CouchPotatoServer-* /couchpotatoserver 

RUN virtualenv /env

WORKDIR /couchpotatoserver

EXPOSE 5050

CMD ["/env/bin/python", "/couchpotatoserver/CouchPotato.py", "--console_log", "--data_dir=/data", "--config_file=/config/couchpota.ini"]
