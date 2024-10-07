{ pkgs-unstable, ... }:
let
  sddm-astronaut = pkgs-unstable.sddm-astronaut.override {
    themeConfig = {
      AccentColor = "#B2D0E2";
      FormPosition = "left";

      ForceHideCompletePassword = true;
    };
  };
in
{
  programs.hyprland.enable = true;

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      autoNumlock = true;
      # needed for sddm theme (qt6 sddm version)
      package = pkgs-unstable.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      extraPackages = [ sddm-astronaut ];
      enableHidpi = true;
      wayland.enable = true;
    };
  };

  environment.systemPackages = [ sddm-astronaut ];
}
