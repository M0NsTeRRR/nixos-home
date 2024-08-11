{
  boot.loader = {
    # systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.devices = [
      "/dev/disk/by-id/ata-VBOX_HARDDISK_VBd954b569-0a9098bd"
    ];
  };
}