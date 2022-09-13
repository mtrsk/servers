{
  description = "NixOS Infrastructure";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }@inputs: {
      nixosConfigurations.fieldops = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
