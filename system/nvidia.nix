{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.mySystem.nvidia;
in
{
  options.mySystem.nvidia = {
    enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable NVIDIA.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    environment.variables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      WEBKIT_DISABLE_DMABUF_RENDERER = "1";
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
  };
}
