{ username, ... }:
{
  imports = [
    ./config.nix
    ./environment.nix
    ./packages.nix
    ./programs.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}