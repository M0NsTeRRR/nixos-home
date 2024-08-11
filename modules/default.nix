{
  imports = [
    hyprland.nixosModules.default
    ./config
    ./hypridle
    #./hyprlock
    ./mako
    ./swaylock
    ./redshift
    ./waybar
    ./wofi
  ];
}