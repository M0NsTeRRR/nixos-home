{ username, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      preload = [
        "/home/${username}/.config/backgrounds/scifi_landscape.jpg"
      ];
      wallpaper = [
        "monitor,/home/${username}/.config/backgrounds/scifi_landscape.jpg"
      ];
    };
  };
}