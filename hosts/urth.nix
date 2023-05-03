{ modulesPath, ... }:

{ imports = [ "${modulesPath}/virtualisation/amazon-image.nix" ];

  documentation.enable = false;

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  services.fail2ban = {
    enable = true;
    jails.DEFAULT = ''
      bantime = 3600
    '';
    jails.ssh = ''
      filter = sshd
      maxretry = 4
      action = iptables[name=ssh, port=ssh, protocol=tcp]
      enabled = true
    '';
  };

  services.nomad = {
    enable = true;
    settings = {
      # DEMO: no fault tolerance
      server = {
        enabled = true;
        bootstrap_expect = 1;
      };
      client = {
        enabled = true;
      };
    };
  };

  system.stateVersion = "22.11";
}
