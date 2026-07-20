{
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
    ./disko.nix
    ../../system
    ../../home
  ];

  boot.supportedFilesystems = [ "btrfs" ];

  mySystem = {
    battery.enable = true;
    usbguard = {
      enable = true;
      rules = ''
        allow id 1d6b:0002 serial "0000:07:00.3" name "xHCI Host Controller" hash "pz29Oo0RhQ+5+7LgOZR4v3OlcsVv3m9kCgGsGUnoUjI=" parent-hash "0ucliRMjldIprxe48uLucRla+MwXWjm3BjOe1IwriL0=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:07:00.3" name "xHCI Host Controller" hash "O6iOpcl9StImWT62SrbeXacqbG6N/mTIipTRc0ipCGM=" parent-hash "0ucliRMjldIprxe48uLucRla+MwXWjm3BjOe1IwriL0=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0002 serial "0000:07:00.4" name "xHCI Host Controller" hash "Hp8B0Enf+ACRT2tyy0EqXj7eNsFDAnTRZadzuh/Iqd4=" parent-hash "yDUn2DiXqqtcIEdDBTvWPAS3N3pEqZ4rLl1feEAXV9U=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:07:00.4" name "xHCI Host Controller" hash "rJ3LKdvkCK3SUrCU3lV8qVbmPjA+r9Fe5106x2HlgK4=" parent-hash "yDUn2DiXqqtcIEdDBTvWPAS3N3pEqZ4rLl1feEAXV9U=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0002 serial "0000:06:00.0" name "xHCI Host Controller" hash "ryHCmG3nsLVuHD/YMplTUyPWzK2YMO368ASLReR84VQ=" parent-hash "WHpbB/3UKLhaqrI19okWw69kopR4n9TG9RQ9uOo5acI=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:06:00.0" name "xHCI Host Controller" hash "P4henx7XTeck/mnkFbsm7WHqQKepsRvcsfgEz32UJIY=" parent-hash "WHpbB/3UKLhaqrI19okWw69kopR4n9TG9RQ9uOo5acI=" with-interface 09:00:00 with-connect-type ""
        allow id 058f:9540 serial "" name "EMV Smartcard Reader" hash "j6z/wqFtA1bZWwBIPmIr/g8KfsEQJ63vpgf4cBcNLbU=" parent-hash "pz29Oo0RhQ+5+7LgOZR4v3OlcsVv3m9kCgGsGUnoUjI=" via-port "1-3" with-interface 0b:00:00 with-connect-type "not used"
        allow id 06cb:00bd serial "63fca17d8711" name "" hash "hzchVuNcbEL4hPcdm2HeT//pL5wUZasLbB2hSl31Cas=" parent-hash "Hp8B0Enf+ACRT2tyy0EqXj7eNsFDAnTRZadzuh/Iqd4=" with-interface ff:00:00 with-connect-type "not used"
        allow id 0489:e0cd serial "000000000" name "Wireless_Device" hash "3JopVFWGRS5OUECbrpyI91sYwRcWP7uB1x2MwHhAtnM=" parent-hash "Hp8B0Enf+ACRT2tyy0EqXj7eNsFDAnTRZadzuh/Iqd4=" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 } with-connect-type "not used"
        allow id 04f2:b6d0 serial "0001" name "Integrated Camera" hash "hUs7N/nTwEEB6EYs8fjHI8+/hhSGPEqX9IJhrMQ0lzY=" parent-hash "ryHCmG3nsLVuHD/YMplTUyPWzK2YMO368ASLReR84VQ=" with-interface { 0e:01:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:01:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 fe:01:01 } with-connect-type "not used"
        allow id 18d1:4ee1 serial "5A161FDCH001QU" name "Pixel 10 Pro" hash "kt8halcoC4acrofc0rkbTULafWQ4SB90b6RIBJgK6IA=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-8" with-interface 06:01:01 with-connect-type "hotplug"
      '';
    };
    vpn = {
      enable = true;
      addresses = [
        "192.168.4.12/32"
        "2a0c:b641:02c0:104::12/128"
      ];
    };
    solaar = {
      enable = true;
    };
  };

  home-manager.users.${config.mySystem.user.name} = {
    wayland.windowManager.hyprland.extraConfig = lib.concatStringsSep "\n" [
      ''
        -----------------------
        ---- MONITORS ---------
        -----------------------
        hl.monitor({ output = "DP-1", mode = "2560x1440@240.00", position = "0x0",     scale = 1 })
        hl.monitor({ output = "DP-2", mode = "2560x1440@144.00", position = "-2560x0", scale = 1 })
        hl.monitor({ output = "",     mode = "preferred",        position = "auto",    scale = "auto" })

        -----------------------
        ---- WORKSPACES -------
        -----------------------
        hl.workspace_rule({ workspace = "1",  persistent = true })
        hl.workspace_rule({ workspace = "2",  persistent = true })
        hl.workspace_rule({ workspace = "3",  persistent = true })
        hl.workspace_rule({ workspace = "4",  persistent = true })
        hl.workspace_rule({ workspace = "5",  persistent = true })
        hl.workspace_rule({ workspace = "6",  persistent = true })
        hl.workspace_rule({ workspace = "7",  persistent = true })
        hl.workspace_rule({ workspace = "8",  persistent = true })
        hl.workspace_rule({ workspace = "9",  persistent = true })
        hl.workspace_rule({ workspace = "10", persistent = true })
      ''
    ];
  };

  system.stateVersion = "24.05";
}
