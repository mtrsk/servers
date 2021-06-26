{pkgs, ...}:
{
  security.sudo.wheelNeedsPassword = false;
  nix.trustedUsers = [ "@wheel" ];

  # SSH & related services
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "no";
    extraConfig = ''
      ChallengeResponseAuthentication no
      KerberosAuthentication no
      GSSAPIAuthentication no

      AllowGroups users
    '';
  };

  users.users.benevides = {
    isNormalUser = true;
    group = "users";
    extraGroups = [
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKStRI4iiTc6nTPKc0SPjHq79psNR5q733InvuHFAT0BHIiKWmDHeLS5jCep/MMrKa1w9qCt3bAnJVyu33+oqISx/5PzDBikiBBtBD6irovJx9dVvkjWkQLcbZwcStUfn6HFjyWdUb1jZqzQMf3JWeIj3RgP8nKwDatHSVB0GkvSETBiJ+bfbGKK1bacusqfsiN3b2niytDgnWMtKB4tMgvGUn5AEqRBtI5zDrnPU1T7edDCjI32QLBln/HlcfAHz+avN4YsW7iTWu25N/MSOQwBrKHLEQviGq9/j3Wu1pzxV2n2m32uUATFEKLf3sLCdsOWm1r+HlsXOcukUZnRhLc9O2ZVoWtDHo72iOzVY6rlRBoHvoUxw6A8k/jZWb1ospvjOLsjZuAZaDSjcE6iM0nXQSdhgGPSgeCTofOgteYoovA4XlK4aNomuTI3OPLr9P9SLC0qJHidvLIGQYWyMiwdeDJESbY2PFUNCi5VffwEUPYh8sp3E8EwjGDvSCygu4fU7vqaOi3OEziwg2ff89CdVr7k606LYmRF3dR+12Cp6XBOgUoaz+OzGn0Sr9HXw3GiF9xH/e1PL6mHwUT2NARB/mI64uY9JAi0/hrwkQsiIx1tf63qUDz/je9gk53wP7/GfWNoIeEkRzCz0QkEnxcMEoLjbTk56JFkmP0fpHDQ== (none)"
    ];
  };

  services.fail2ban = {
    enable = true;
    bantime-increment = {
      maxtime = "4h";
    };
  };

  # Clean up /nix/store/ after a week
  nix.gc = {
    automatic = true;
    dates = "weekly UTC";
  };

  networking.hostName = "nixos-vultr";
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Packages
  environment.systemPackages = with pkgs; [
    git
    nvim
    htop
  ];
}
