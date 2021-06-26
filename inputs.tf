variable "vultr_api_key" {
  type = string
}

variable "users" {
  type = list(object({
    username = string
    email    = string
    fullname = string
    pubkeys  = list(string)
  }))
}

