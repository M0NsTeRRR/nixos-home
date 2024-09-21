{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ["steam"];
  
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
    gamemode.enable = true;
  };
}