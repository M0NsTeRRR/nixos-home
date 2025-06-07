{ lib, guiEnabled, ... }:
let
  defaultImports = [
    ./gpg.nix
    ./ssh-agent.nix
  ];

  guiImports = [
    ./kdeconnect.nix
  ];
in
{
  imports = defaultImports ++ lib.optionals guiEnabled guiImports;
}
