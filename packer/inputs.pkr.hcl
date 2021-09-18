# Variables
variable "location" {
  type        = string
  description = "The AWS region you're using"
  default     = "us-east-1"
}

## Credentials
variable "access_key" {
  type      = string
  default   = "${env("AWS_ACCESS_KEY_ID")}"
  sensitive = true
}

variable "secret_access_key" {
  type      = string
  default   = "${env("AWS_SECRET_ACCESS_KEY")}"
  sensitive = true
}
