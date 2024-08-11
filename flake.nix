{
  description = "Ludovic Ortega Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";  

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@attrs: 
    let
      username = "lortega";
      system = "x86_64-linux";
    in
    {
      system.stateVersion = "24.05";
      
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      
      nixpkgs.config = {
        allowUnfreePredicate = pkg: true;
        allowUnfree = true;
      };
      
      nixosConfigurations = {
        ludo-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            hostName = "ludo-desktop";
            inherit username system;
          } // attrs;
          modules = [
            ./.
          ];
        };

        ludo-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            hostName = "ludo-laptop";
            inherit username system;
          } // attrs;
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
