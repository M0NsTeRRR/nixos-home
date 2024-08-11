{ pkgs, ...}:
{
  home.packages = [ pkgs.blueman ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman-applet.enable = true;
}