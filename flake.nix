{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.urth = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./module.nix ];
    };
  };
}
