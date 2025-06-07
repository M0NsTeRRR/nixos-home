{ gui, ... }:
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
  imports = defaultImports ++ (if gui then guiImports else []);
}
