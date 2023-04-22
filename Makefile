include .env
export

.PHONY: init plan

init:
	@terraform init

plan:
	@terraform plan -out tfplan

apply:
	@terraform apply "tfplan"

destroy:
	@terraform destroy

deploy:
	nix run nixpkgs\#nixos-rebuild switch -- --flake .\#example --target-host mtrsk@$$HOST --build-host localhost --use-remote-sudo
