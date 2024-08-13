{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [ pulseaudio ];

  users.users.${username} = {
    extraGroups = [ "audio" ];
  };

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}