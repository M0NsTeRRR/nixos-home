{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      appearance = {
        scheme = "Tokyo-Night";
      };
      cursor = {
        theme = "Bibata-Modern-Classic";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };
      keyboard.layout = "fr";
      session.default = "Hyprland";
      user.default = "lortega";
    };
  };
}
