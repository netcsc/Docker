FROM kibana:4.5.0

RUN kibana plugin --install kibana/shield/latest
RUN kibana plugin --install elasticsearch/marvel/2.3.2
RUN chown -R kibana:kibana /opt/kibana

ADD ./config-dir /opt/kibana/config
COPY ./init_app.sh /root/init_app.sh

ENTRYPOINT ["/root/init_app.sh"]
