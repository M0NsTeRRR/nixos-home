{
  description = "Ludovic Ortega Nix configuration";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager-stable, home-manager-unstable, ... }@inputs:
  let
    username = "lortega";
    hostNames = [ "laptop" "desktop" ];
    system = "x86_64-linux";
    lib = nixpkgs-stable.lib;
    pkgs = nixpkgs-stable.legacyPackages.${system};
  in
  {
    nixosConfigurations = lib.genAttrs hostNames (hostName: lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit hostName username;
      } // inputs;
      modules = [
        ./.
      ];
    });

    templates.default = {
      path = ./.;
      description = "The default template for Ludovic Ortega nixflakes.";
    };
  };
}
