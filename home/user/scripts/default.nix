{ lib, guiEnabled, ... }:
let
  defaultImports = [];

  guiImports = [
    ./yad.nix
  ];
in
{
  imports = defaultImports ++ lib.optionals guiEnabled guiImports;
}
