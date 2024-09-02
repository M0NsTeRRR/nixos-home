{ pkgs, ... }:
{
  # used by nautilus
  services.gvfs.enable = true;
  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
}