FROM debian:jessie

ENV FILEBEAT_VERSION=1.2.2

RUN set -x && \
  apt-get update && \
  apt-get install -y curl && \
  curl -L -O https://download.elastic.co/beats/filebeat/filebeat_${FILEBEAT_VERSION}_amd64.deb && \
  dpkg -i filebeat_${FILEBEAT_VERSION}_amd64.deb && \
  rm -rf filebeat_* && \
  apt-get purge -y wget && \
  apt-get autoremove -y && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY ./init_app.sh /
COPY ./filebeat.yml /etc/filebeat/filebeat.yml
ADD ./tls /etc/filebeat/tls/

ENTRYPOINT ["/init_app.sh"]
