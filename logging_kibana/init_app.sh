#!/bin/bash

# take type from environment
CONF_FILE=/opt/kibana/config/kibana.yml

sed -i "s#SHIELD_KIBANA_USER#$SHIELD_KIBANA_USER#" $CONF_FILE
sed -i "s#SHIELD_KIBANA_PASSWORD#$SHIELD_KIBANA_PASSWORD#" $CONF_FILE
sed -i "s#SHIELD_ENCRYPTIONKEY#$SHIELD_ENCRYPTIONKEY#" $CONF_FILE

/docker-entrypoint.sh kibana
