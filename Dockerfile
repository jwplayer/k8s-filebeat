FROM alpine:edge
MAINTAINER Michael Stella <michael@jwplayer.com>
LABEL CostCenter="Ops" Application="kubernetes"

# Note that this currently uses the 'testing' repo - filebeat is not
# yet in Alpine's main package repo.
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ filebeat

COPY configs/*.yml /etc/filebeat/
COPY configs/outputs/*.yml /etc/filebeat/

ENV output logstash

ENTRYPOINT /usr/bin/filebeat -e -v -c /etc/filebeat/${output}.yml -c /etc/filebeat/containers.yml
