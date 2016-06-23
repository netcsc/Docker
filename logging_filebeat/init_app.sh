#!/bin/bash

FILEBEAT_PATH=/etc/filebeat/filebeat.yml

sed -i "s#LOGSTASH_HOST#$LOGSTASH_HOST#" $FILEBEAT_PATH
sed -i "s#NUMBER_OF_WORKER#$NUMBER_OF_WORKER#" $FILEBEAT_PATH
sed -i "s#LOADBALANCE#$LOADBALANCE#" $FILEBEAT_PATH
sed -i "s#CERTIFICATE_AUTHORITIES#$CERTIFICATE_AUTHORITIES#" $FILEBEAT_PATH
sed -i "s#CERTIFICATE_PATH#$CERTIFICATE_PATH#" $FILEBEAT_PATH
sed -i "s#CERTIFICATE_KEY#$CERTIFICATE_KEY#" $FILEBEAT_PATH
sed -i "s#PROSPECTORS_PATHS#$PROSPECTORS_PATHS#" $FILEBEAT_PATH
sed -i "s#INPUT_TYPE#$INPUT_TYPE#" $FILEBEAT_PATH
sed -i "s#INSECURE#$INSECURE#" $FILEBEAT_PATH

if [ $TLS_ENABLE == "false" ]; then
  sed -i "s/    tls: #logstash/    #tls: #logstash/" $FILEBEAT_PATH
  sed -i "s/certificate_authorities: /#certificate_authorities: /" $FILEBEAT_PATH
  sed -i "s/certificate: /#certificate: /" $FILEBEAT_PATH
  sed -i "s/certificate_key: /#certificate_key: /" $FILEBEAT_PATH
  sed -i "s/insecure: /#insecure: /" $FILEBEAT_PATH
else
  sed -i "s/    #tls: #logstash/    tls: #logstash/" $FILEBEAT_PATH
  sed -i "s/#certificate_authorities: /certificate_authorities: /" $FILEBEAT_PATH
  sed -i "s/#certificate: /certificate: /" $FILEBEAT_PATH
  sed -i "s/#certificate_key: /certificate_key: /" $FILEBEAT_PATH
  sed -i "s/#insecure: /insecure: /" $FILEBEAT_PATH
fi

filebeat -e -c $FILEBEAT_PATH
