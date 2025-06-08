{ pkgs, lib, guiEnabled, wslEnabled, ... }:
let
  scriptDir = ../script;

  guiScripts = [
    (pkgs.writeShellScriptBin "yad" (builtins.readFile (scriptDir + "/yad.sh")))
  ];

  wslScripts = [];
in
{
  home.packages = []
    ++ lib.optionals guiEnabled guiScripts
    ++ lib.optionals wslEnabled wslScripts;
}
