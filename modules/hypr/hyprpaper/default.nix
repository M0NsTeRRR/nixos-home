{ username, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {

      ".config/hypr/hyprpaper.conf".text = ''
        preload = /home/${username}/.config/backgrounds/scifi_landscape.jpg
        wallpaper = monitor,/home/${username}/.config/backgrounds/scifi_landscape.jpg
      '';
    };
  };
}