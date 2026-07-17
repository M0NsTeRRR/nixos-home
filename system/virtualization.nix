{ config, pkgs, ... }:
{
  users.users.${config.mySystem.user.name} = {
    extraGroups = [ "libvirtd" ];
  };

  environment.systemPackages = with pkgs; [
    podman-compose
    qemu
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-spice
    virtio-win
  ];

  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
      };
    };

    podman = {
      enable = true;

      dockerSocket.enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
