packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.1, < 2.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# Builders
build {
  sources = ["source.amazon-ebs.nixos_git"]

  provisioner "file" {
    destination = "/tmp/configuration.nix"
    source      = "../nixos/configuration.nix"
  }

  provisioner "shell" {
    execute_command = "sudo -S env {{ .Vars }} {{ .Path }}"
    inline = [
      "mv /tmp/configuration.nix /etc/nixos/configuration.nix",
      "nixos-rebuild switch --upgrade",
      "nix-collect-garbage -d",
      "rm -rf /etc/ec2-metadata /etc/ssh/ssh_host_* /root/.ssh"
    ]
  }
}
