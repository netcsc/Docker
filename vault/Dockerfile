FROM alpine:edge

ENV VAULT_VERSION=0.6.0

RUN  apk add --update curl bash ca-certificates \
  && curl -L -O https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip vault_${VAULT_VERSION}_linux_amd64.zip \
  && mkdir -p /root/vault \
  && mv vault /root/vault/ \
  && rm -f vault_${VAULT_VERSION}_linux_amd64.zip \
  && rm -r /var/cache/apk/*

COPY ./vault.hcl /root/vault/
COPY ./init_app.sh /
ENV PATH /root/vault:$PATH
ENV VAULT_ADDR 'http://127.0.0.1:8200'
EXPOSE 8200
ENTRYPOINT ["/init_app.sh"]

