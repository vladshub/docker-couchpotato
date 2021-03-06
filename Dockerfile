FROM python:2.7-alpine3.11
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

EXPOSE 5050
ENV PYTHONIOENCODING "UTF-8"
RUN apk upgrade --no-cache && apk add --no-cache py-lxml py-openssl git
COPY entrypoint.sh /
ENV COUCHPOTATO_VERSION "master"
RUN git clone https://github.com/CouchPotato/CouchPotatoServer.git /couchpotatoserver \
	&& cd /couchpotatoserver \
	&& git checkout $COUCHPOTATO_VERSION

WORKDIR /couchpotatoserver
ENV DATA_DIR "/data"
ENV CONFIG_FILE "/config/couchpota.ini"

ENTRYPOINT ["/entrypoint.sh"]
