{ config, username, ... }:
{
  users.users.${username} = {
    extraGroups = [
      "video"
      "render"
    ];
  };

  # Enable NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics = {
    enable = true;
    #   driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}