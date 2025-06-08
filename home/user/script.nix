{ pkgs, lib, guiEnabled, ... }:
let
  scriptDir = ../script;

  guiScripts = [
    (pkgs.writeShellScriptBin "yad" (builtins.readFile (scriptDir + "/yad.sh")))
  ];
in
{
  home.packages = []
    ++ lib.optionals guiEnabled guiScripts;
}
