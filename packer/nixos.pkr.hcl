# "timestamp" template function replacement
locals {
  timestamp = formatdate("YYYY-MM-DD-hh_mm", timestamp())
}

source "amazon-ebs" "nixos_git" {
  access_key = var.access_key
  secret_key = var.secret_access_key
  region     = var.location
  ami_name   = "nixos-${local.timestamp}"
  source_ami_filter {
    filters = {
      architecture = "x86_64"
    }
    most_recent = true
    owners      = ["080433136561"]
  }
  instance_type = "t2.micro"
  launch_block_device_mappings {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    volume_size           = 20
    volume_type           = "gp2"
  }
  ssh_username = "root"
}
