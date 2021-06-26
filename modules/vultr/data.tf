data "cloudinit_config" "user_setup" {
  gzip          = true
  base64_encode = true

  # Setup locale
  part {
    content_type = "text/cloud-config"
    content      = file("${path.root}/cloud_init/locale.yml")
  }

  # Give access to some users
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.root}/cloud_init/users.yml", {
      users = var.users
    })
    merge_type = "list(append)+dict(recurse_array)+str()"
  }
}

