{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
  {
    nixosConfigurations.urth = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./urth.nix ];
    };
  };
}
