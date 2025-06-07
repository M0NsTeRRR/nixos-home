{ gui, ... }:
let
  defaultImports = [];

  guiImports = [
    ./yad.nix
  ];
in
{
  imports = defaultImports ++ (if gui then guiImports else []);
}
