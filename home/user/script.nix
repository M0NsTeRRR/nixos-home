{ pkgs, lib, guiEnabled, wslEnabled, ... }:
let
  scriptDir = ../script;

  guiScripts = [
    (pkgs.writeShellScriptBin "yad" (builtins.readFile (scriptDir + "/yad.sh")))
  ];

  wslScripts = [
    (pkgs.writeShellScriptBin "wsl-ssh-agent-relay" (builtins.readFile (scriptDir + "/wsl-ssh-agent-relay.sh")))
  ];
in
{
  home.packages = []
    ++ lib.optionals guiEnabled guiScripts
    ++ lib.optionals wslEnabled wslScripts;
}
