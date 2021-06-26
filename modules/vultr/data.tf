data "cloudinit_config" "user_setup" {
  gzip          = true
  base64_encode = true

  # Setup locale
  part {
    content_type = "text/cloud-config"
    content      = file("${path.root}/cloud_init/locale.yml")
  }

  # INSTALL NIXOS
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.root}/cloud_init/install_nixos.yml", {
      config_content = filebase64("${path.module}/host.nix")
    })
    merge_type = "list(append)+dict(recurse_array)+str()"
  }
}

