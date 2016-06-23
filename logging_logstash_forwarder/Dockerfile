FROM logstash:2.3.2

RUN mkdir -p /config-dir \
  && apt-get update && apt-get install -y \
  vim \
  && rm -rf /var/lib/apt/lists/* \
  && /opt/logstash/bin/logstash-plugin install logstash-input-beats \
  && /opt/logstash/bin/logstash-plugin install logstash-filter-json_encode

ADD ./config-dir /config-dir
ADD ./tls /config-dir/tls/
COPY ./init_app.sh /root/init_app.sh

ENTRYPOINT ["/root/init_app.sh"]
