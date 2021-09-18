include .env
export

.PHONY: init
init:
	@terraform init

plan:
	@terraform plan -out tfplan

apply:
	@terraform apply "tfplan"

destroy:
	@terraform destroy

build:
	@cd packer; packer build -var-file=credentials.auto.pkvars.hcl .

