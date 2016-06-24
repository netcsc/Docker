# Environment Properties
```
REDIS_HOST: REDIS endpoint via load balancer FQDN
ELASTICSEARCH_HOST: elasticsearch data nodes via load balancer FQDN
SSL_ENABLE: true|false
SSL_CERTIFICATE: path to the ssl public key
SSL_KEY: path to the ssl private key
type: aggregator|forwarder
```

# Log Type - init script takes $type environment variable and decides which logstash conf to include
## aggregator
read redis input and output to elasticsearch

## forwarder
read from beats and output to redis
