{ username, ... }:
{
  imports = [
    ./config.nix
    ./environment.nix
    ./packages.nix
    ./programs
    ./script.nix
  ];
}