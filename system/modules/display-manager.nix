{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      autoNumlock = true;
      # needed for sddm theme (qt6 sddm version)
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      enableHidpi = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
    };
  };

  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      themeConfig = {
        AccentColor = "#B2D0E2";
        FormPosition = "left";
        ForceHideCompletePassword = true;
      };
    })
  ];
}
