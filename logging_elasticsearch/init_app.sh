#!/bin/bash

sed -i "s#CLUSTER_NAME#$CLUSTER_NAME#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#NETWORK_HOST#$NETWORK_HOST#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#NODE_NAME#$HOSTNAME#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#NODE_MASTER#$NODE_MASTER#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#NODE_DATA#$NODE_DATA#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#INDEX_NUMBER_OF_SHARDS#$INDEX_NUMBER_OF_SHARDS#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#INDEX_NUMBER_OF_REPLICAS#$INDEX_NUMBER_OF_REPLICAS#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#HTTP_ENABLED#$HTTP_ENABLED#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#DISCOVERY_ZEN_PING_UNICAST_HOSTS#$DISCOVERY_ZEN_PING_UNICAST_HOSTS#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#EMAIL_ADDRESS#$EMAIL_ADDRESS#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#SMTP_HOST#$SMTP_HOST#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#SMTP_PORT#$SMTP_PORT#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#SMTP_USER#$SMTP_USER#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#SMTP_PASSWORD#$SMTP_PASSWORD#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#PATH_REPO#$PATH_REPO#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#MARVEL_USER#$MARVEL_USER#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#MARVEL_PASSWORD#$MARVEL_PASSWORD#" /usr/share/elasticsearch/config/elasticsearch.yml
sed -i "s#MARVEL_HOSTS#$MARVEL_HOSTS#" /usr/share/elasticsearch/config/elasticsearch.yml

chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/shield/roles.yml
/usr/share/elasticsearch/bin/shield/esusers useradd $SHIELD_ADMIN_USER -r admin -p $SHIELD_ADMIN_PASSWORD
/usr/share/elasticsearch/bin/shield/esusers useradd $SHIELD_LOGSTASH_USER -r logstash -p $SHIELD_LOGSTASH_PASSWORD
/usr/share/elasticsearch/bin/shield/esusers useradd $SHIELD_KIBANA_USER -r kibana4_server -p $SHIELD_KIBANA_PASSWORD

/docker-entrypoint.sh elasticsearch
