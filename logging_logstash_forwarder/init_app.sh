#!/bin/bash

# take type from environment
CONF_FILE=/config-dir/logstash.conf

# NUM_OF_WORKER, REDIS_HOST and ELASTICSEARCH_HOST
# are from DEEP tool

sed -i "s#REDIS_HOST#$REDIS_HOST#" $CONF_FILE
sed -i "s#SSL_ENABLE#$SSL_ENABLE#" $CONF_FILE
sed -i "s#SSL_AUTHORITIES#$SSL_AUTHORITIES#" $CONF_FILE
sed -i "s#SSL_CERTIFICATE#$SSL_CERTIFICATE#" $CONF_FILE
sed -i "s#SSL_KEY#$SSL_KEY#" $CONF_FILE
sed -i "s#SSL_VERIFY_MODE#$SSL_VERIFY_MODE#" $CONF_FILE

/docker-entrypoint.sh logstash agent -w $NUM_OF_WORKER -f $CONF_FILE
