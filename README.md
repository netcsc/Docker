# Useful APIs
###### write secret record ######
```
curl \
-H "X-Vault-Token: <Secret Token ID>" \
-H "Content-Type: application/json" \
-X POST \
-d '{"password":"abcd1234"}' \
http://<vault_server_host_or_ip>:8200/v1/secret/test
```

###### read secret record ######
```
curl \
-H "X-Vault-Token: <Secret Token ID>" \
-X GET \
http://<vault_server_host_or_ip>:8200/v1/secret/test
```

###### unseal backend repo ######
```
curl \
-X PUT \
-d '{"key": "<Seal Key>"}' \
http://<vault_server_host_or_ip>:8200/v1/sys/unseal
```

###### check seal status of backend repo ######
```
curl \
-H "X-Vault-Token: <Admin Token ID>" \
-X GET \
http://<vault_server_host_or_ip>:8200/v1/sys/seal-status
```

###### list all access control polices ######
```
curl \
-H "X-Vault-Token: <Root Token ID>" \
-X GET \
http://<vault_server_host_or_ip>:8200/v1/sys/policy
```

###### define secret policy with access to secret records ######
```
curl \
-H "X-Vault-Token: <Root Token ID>" \
-X PUT \
-d '{ "rules": "\npath \"sys/*\" {\n capabilities = [\"deny\"]\n}\n\npath \"secret/*\" {\n capabilities = [\"create\", \"read\", \"update\", \"delete\", \"list\"]}"}' \
http://<vault_server_host_or_ip>:8200/v1/sys/policy/secret
```

###### define admin policy with access seal operations and token creation ######
```
curl \
-H "X-Vault-Token: <Root Token ID>" \
-X PUT \
-d '{ "rules": " \npath \"sys/*\" {\n capabilities = [\"deny\"]} \npath \"sys/seal-status\" {\n capabilities = [\"sudo\"]} \npath \"sys/unseal\" {\n capabilities = [\"sudo\"]} \npath \"sys/seal\" {\n capabilities = [\"sudo\"]} \npath \"auth/token/*\" {\n capabilities = [\"sudo\"]}"}' \
http://<vault_server_host_or_ip>:8200/v1/sys/policy/admin
```

###### create a token with secret policy ######
```
curl \
-H "X-Vault-Token: <Admin Token ID>" \
-X POST \
-d '{"display_name":"devtest","policies":["secret"],"ttl":"4320h"}' \
http://<vault_server_host_or_ip>:8200/v1/auth/token/create
```

###### create a token with admin policy ######
```
curl \
-H "X-Vault-Token: <Admin Token ID>" \
-X POST \
-d '{"display_name":"devtest_admin","policies":["admin"],"ttl":"4320h"}' \
http://<vault_server_host_or_ip>:8200/v1/auth/token/create
```
