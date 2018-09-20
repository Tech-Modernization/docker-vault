# Vault Official Image Build

The version of this hosted on [HashiCorp's Docker Hub for Vault](https://hub.docker.com/r/hashicorp/vault/)
is built from the same source as the [Vault Official Image](https://hub.docker.com/_/vault/).

There are several pieces that are used to build this image:

* We start with an Alpine base image and add CA certificates in order to reach
  the HashiCorp releases server. These are useful to leave in the image so that
  the container can access Atlas features as well.
* Finally a specific Vault build is fetched and the rest of the Vault-specific
  configuration happens according to the Dockerfile.


## Adaptations for Enterprise

The following documents the changes necessary for Vault.


### URLs

* Linux: https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/vault/ent/0.11.1/vault-enterprise_0.11.1%2Bent_linux_amd64.zip
* Checksums: https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/vault/ent/0.11.1/vault-enterprise_0.11.1%2Bent_SHA256SUMS
* Signature: https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/vault/ent/0.11.1/vault-enterprise_0.11.1%2Bent_SHA256SUMS.sig

### Licensing

    curl \
      --header "X-Vault-Token: ..." \
      --request PUT \
      --data @vault.license \
      http://127.0.0.1:8200/v1/sys/license

* https://www.vaultproject.io/api/system/license.html
