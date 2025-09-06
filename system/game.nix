{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}:
let
  cfg = config.mySystem.game;
in
{
  options.mySystem.game = {
    enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable Game.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      steam-run
      protonup
      mangohud # monitoring FPS, temperatures, CPU/GPU load and more
      heroic # epic, gog games
      pkgs-unstable.ankama-launcher # game launcher
    ];

    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        gamescopeSession.enable = true;
      };
      gamemode.enable = true;
    };
  };
}
