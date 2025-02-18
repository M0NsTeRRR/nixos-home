{ pkgs, config, ... }:
{
  # Enable NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true; # Disable if issues with sleep/suspend
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    graphics = {
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
