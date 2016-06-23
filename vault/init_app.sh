#!/bin/bash

VAULT_PATH=/root/vault/vault.hcl

sed -i "s#CONSUL_ADDRESS_PORT#$CONSUL_ADDRESS_PORT#" $VAULT_PATH
sed -i "s#CERTIFICATE_PATH#$CERTIFICATE_PATH#" $VAULT_PATH
sed -i "s#CERTIFICATE_KEY#$CERTIFICATE_KEY#" $VAULT_PATH

vault server -config=$VAULT_PATH

