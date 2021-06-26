resource "vultr_instance" "my_instance" {
  plan             = "vc2-1c-1gb"
  region           = var.vultr_region
  os_id            = 413
  label            = "nixos-server"
  tag              = "nixos"
  hostname         = "nixos-vultr"
  user_data        = data.cloudinit_config.user_setup.rendered
  enable_ipv6      = false
  activation_email = false
}

