{ config, pkgs, ... }:
{
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

  users.users.${config.mySystem.user.name} = {
    extraGroups = [ "libvirtd" ];
  };

  boot.binfmt = {
    emulatedSystems = [
      "aarch64-linux"
    ];
    # Static qemu + "F" flag: required so containers (podman) can run foreign-arch binaries
    preferStaticEmulators = true;
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];
  networking.firewall.extraForwardRules = ''
    iifname "virbr0" accept
    oifname "virbr0" ct state { established, related } accept
  '';

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
