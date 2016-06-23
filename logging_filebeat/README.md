# Environment properties
LOGSTASH_HOST: host of logstash forwarder, this should be load balancer FQDN
NUMBER_OF_WORKER:  4, number of workers on logstash forwarder, times two of number of CPU on logstash server is a good practice
LOADBALANCE: true|false, if multiple logtash IP being provided, a load balance option from filebeat is provided
CERTIFICATE_AUTHORITIES: path of ssl certificates
CERTIFICATE_PATH: path of ssl certificates
CERTIFICATE_KEY: path of ssl private key
PROSPECTORS_PATHS: path for logs being forwarded
INPUT_TYPE: tag of the log, e.g. "log"
TLS_ENABLE: true|false

