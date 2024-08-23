{ pkgs, username, ...}:
{
  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "${username}";
      };
    };
  };
}