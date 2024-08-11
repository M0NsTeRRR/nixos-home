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

  outputs = { self, nixpkgs, ... }@attrs:
  {  
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    nixpkgs.config = {
      allowUnfreePredicate = pkg: true;
      allowUnfree = true;
    };
    
    nixosConfigurations = {
      ludo-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          hostName = "ludo-desktop";
          system = "x86_64-linux";
        } // attrs;
        modules = [
          ./.
        ];
      };

      ludo-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          hostName = "ludo-laptop";
          system = "x86_64-linux";
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