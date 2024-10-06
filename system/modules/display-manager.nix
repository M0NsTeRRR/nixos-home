{
  services.displayManager = {
    enable = true;
    defaultSession = "hyprland";
    sddm = {
      autoNumlock = true;
      theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
      wayland.enable = true;
    };
  };
}