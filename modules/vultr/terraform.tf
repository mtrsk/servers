variable "vultr_api_key" {}
variable "vultr_region" {}
variable "users" {}

terraform {
  required_providers {
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "=2.2.0"
    }

    vultr = {
      source  = "vultr/vultr"
      version = "=2.3.3"
    }
  }
}

# Configure the Vultr Provider
provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 700
  retry_limit = 3
}
