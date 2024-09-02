{ username, ... }:
{
  imports = [
    ./config.nix
    ./environment.nix
    ./packages.nix
    ./programs
    ./script.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}