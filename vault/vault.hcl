backend "consul" {
  address = "CONSUL_ADDRESS_PORT"
  path = "vault"
}

listener "tcp" {
 address = "0.0.0.0:8200"
 tls_disable = 0
 tls_cert_file = "CERTIFICATE_PATH"
 tls_key_file = "CERTIFICATE_KEY"
}

