#!/bin/bash

while [[ $# -gt 1 ]]
do
    INPUT="$1"
    case $INPUT in
        -a|--action)
        action="$2"
        shift
        ;;
        -k|--key)
        app_key="$2"
        shift
        ;;
        -v|--value)
        value="$2"
        shift
        ;;
        * )
        # Unknown
        ;;
    esac
    shift
done

do_help () {
    echo "Action can be specified with -a or --action"
    echo "Application key can be specified with -k or --key"
    echo "Input values can be specified with -v or --value"
    echo " "
    echo "./manage_vault.sh -a write -k test -v \"{json_obj}\""
    echo " "
    exit 1
}

case $action in
    read)
       result=$(curl -k \
         -H "X-Vault-Token: $token" \
         -X GET \
         https://$vault_host:8200/v1/secret/$app_key)
       ;;
    write)
       result=$(curl -k \
         -H "X-Vault-Token: $token" \
         -H "Content-Type: application/json" \
         -X POST \
         -d $value \
         https://$vault_host:8200/v1/secret/$app_key)
       ;;
    status)
       result=$(curl -k \
         -H "X-Vault-Token: $token" \
         -X GET \
         https://$vault_host:8200/v1/sys/seal-status)
       ;;
    seal)
       result=$(curl -k \
         -H "X-Vault-Token: $token" \
         -X PUT \
         https://$vault_host:8200/v1/sys/seal)
       ;;
    unseal)
       result=$(curl -k \
         -X PUT \
         -d "$seal_key" \
         https://$vault_host:8200/v1/sys/unseal)
       ;;
    define_policy)
       result=$(curl -k \
         -H "X-Vault-Token: $token" \
         -X PUT \
         -d $value \
         https://$vault_host:8200/v1/sys/policy/$policy_name)
       ;;
    list_policy)
        result=$(curl -k \
          -H "X-Vault-Token: $token" \
          -X GET \
          https://$vault_host:8200/v1/sys/policy)
        ;;
    lookup_token)
        result=$(curl -k \
          -H "X-Vault-Token: $token" \
          -X GET \
          https://$vault_host:8200/v1/auth/token/lookup/$token_name)
        ;;
    generate_token)
        result=$(curl -k \
          -H "X-Vault-Token: $token" \
          -X POST \
          -d $value \
          https://$vault_host:8200/v1/auth/token/create)
        ;;
    *)
        do_help
        ;;
esac

echo $result > result.json

