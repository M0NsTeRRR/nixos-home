{
  environment.systemPackages = with pkgs; [
    steam-run
    protonup
    mangohud # monitoring FPS, temperatures, CPU/GPU load and more
    heroic # epic, gog games
  ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
    gamescopeSession.enable = true;
    gamemode.enable = true;
  };
}
