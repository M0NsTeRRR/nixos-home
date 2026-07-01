{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.mySystem.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    environment.systemPackages = with pkgs; [
      libva-utils # VA-API utilities for testing video acceleration
      vulkan-tools # Vulkan utilities (vulkaninfo, vkcube)
    ];

    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true; # Disable if issues with sleep/suspend
        powerManagement.finegrained = false;
        open = true;
        nvidiaSettings = false;
        # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
        package = config.boot.kernelPackages.nvidiaPackages.latest;
      };
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
          libva-vdpau-driver
          libvdpau-va-gl
          vulkan-loader
          vulkan-validation-layers
        ];
      };
    };
  };
}
