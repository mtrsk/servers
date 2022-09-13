{
  description = "NixOS IAC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }@inputs: {
      nixosConfigurations.example = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
