resource "vultr_startup_script" "nixos_install" {
  name   = "nixos_install_script"
  script = filebase64("${path.root}/nixos_infect.sh")
}

resource "vultr_bare_metal_server" "server" {
  plan             = "vc2-1c-1gb"
  region           = var.vultr_region
  os_id            = 413
  label            = "nixos-server"
  tag              = "nixos"
  hostname         = "admin"
  script_id        = vultr_startup_script.nixos_install.id
  user_data        = data.cloudinit_config.user_setup.rendered
  enable_ipv6      = false
  activation_email = false
}
