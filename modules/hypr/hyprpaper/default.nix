{ username, ... }:
{
  services.hyprpaper.settings = {
    preload = [
      "/home/${username}/.config/backgrounds/scifi_landscape.jpg"
    ];

    wallpaper = [
      "monitor,/home/${username}/.config/backgrounds/scifi_landscape.jpg"
    ];
  };
}