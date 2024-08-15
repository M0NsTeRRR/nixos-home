{
  description = "Ludovic Ortega Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
    

  outputs =
    { self, nixpkgs, ... }@inputs: 
    let
      username = "lortega";
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {      
      nixosConfigurations = {
        ludo-desktop = lib.nixosSystem {
          inherit system;
          specialArgs = {
            hostName = "ludo-desktop";
            inherit username;
          } // inputs;
          modules = [
            ./.
          ];
        };

        ludo-laptop = lib.nixosSystem {
          inherit system;
          specialArgs = {
            hostName = "ludo-laptop";
            inherit username;
          } // inputs;
          modules = [
            ./.
          ];
        };
      };

      templates.default = {
        path = ./.;
        description = "The default template for Ludovic Ortega nixflakes.";
      };
    };
}
