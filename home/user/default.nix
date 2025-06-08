{ lib, guiEnabled, ... }:

let
  defaultImports = [
    ./config.nix
    ./environment.nix
    ./packages.nix
    ./programs
    ./script.nix
    ./services
    ./xdg.nix
  ];

  guiImports = [
    ./theme.nix
  ];
in
{
  imports = defaultImports ++ lib.optionals guiEnabled guiImports;
}
