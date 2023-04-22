variable "region" {
  type     = string
  default  = "us-east-1"
  nullable = false
}

provider "aws" {
  profile = "nixos"
  region  = var.region
}

