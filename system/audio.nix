{ config, ... }:
{
  users.users.${config.mySystem.user.name} = {
    extraGroups = [ "audio" ];
  };

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
