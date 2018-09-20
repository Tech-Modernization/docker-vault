VAULT_VERSION?=0.11.1

build:
	cd 0.X && \
		docker build \
			--build-arg VAULT_VERSION=$(VAULT_VERSION) \
			-t vault-enterprise:$(VAULT_VERSION) .
