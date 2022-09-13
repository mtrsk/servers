include .env
export

.PHONY: build

build:
	packer build -var-file=credentials.auto.pkvars.hcl .
