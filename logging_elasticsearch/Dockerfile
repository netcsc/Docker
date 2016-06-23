FROM elasticsearch:2.3.2

RUN plugin install mobz/elasticsearch-head
RUN plugin install -b elasticsearch/license/latest
RUN plugin install -b elasticsearch/watcher/latest
RUN plugin install -b marvel-agent
RUN plugin install -b elasticsearch/shield/latest -Des.path.conf=/usr/share/elasticsearch/config
RUN ln -s /usr/share/elasticsearch/config/shield /etc/elasticsearch/shield

COPY config/elasticsearch.default /etc/default/elasticsearch
COPY config/elasticsearch.yml /usr/share/elasticsearch/config/
COPY config/logging.yml /usr/share/elasticsearch/config/
COPY config/roles.yml /usr/share/elasticsearch/config/shield/
COPY init_app.sh /root/

ENTRYPOINT ["/root/init_app.sh"]
