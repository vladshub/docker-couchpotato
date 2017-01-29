FROM vladshub/python-virtualenv
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

EXPOSE 5050
ENV PYTHONIOENCODING "UTF-8"
COPY entrypoint.sh /
RUN virtualenv /env
ENV COUCHPOTATO_VERSION "master"
RUN git clone https://github.com/CouchPotato/CouchPotatoServer.git /couchpotatoserver \
	&& cd /couchpotatoserver \
	&& git checkout $COUCHPOTATO_VERSION

WORKDIR /couchpotatoserver

ENTRYPOINT ["/entrypoint.sh"]
