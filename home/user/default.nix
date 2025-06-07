{ lib, guiEnabled, ... }:

let
  defaultImports = [
    ./config.nix
    ./environment.nix
    ./packages.nix
    ./programs
    ./scripts
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
