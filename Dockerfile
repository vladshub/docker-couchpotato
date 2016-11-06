FROM vladshub/python-virtualenv
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

EXPOSE 5050
ENV PYTHONIOENCODING "UTF-8"
COPY entrypoint.sh /
RUN virtualenv /env

ENV COUCHPOTATO_VERSION "master"
RUN wget -q "https://github.com/RuudBurger/CouchPotatoServer/archive/$COUCHPOTATO_VERSION.tar.gz" \
  && tar xzf *.tar.gz && rm *.tar.gz \
  && mv CouchPotatoServer-* /couchpotatoserver 

WORKDIR /couchpotatoserver

ENTRYPOINT ["/entrypoint.sh"]
