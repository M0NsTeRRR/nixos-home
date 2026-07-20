{ lib, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../system
    ../../home
  ];

  boot.supportedFilesystems = [ "btrfs" ];

  mySystem = {
    game.enable = true;
    nvidia.enable = true;
    thunderbolt.enable = true;
    usbguard = {
      enable = true;
      rules = ''
        allow id 1d6b:0002 serial "0000:00:14.0" name "xHCI Host Controller" hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" parent-hash "rV9bfLq7c2eA4tYjVjwO4bxhm+y6GgZpl9J60L0fBkY=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:00:14.0" name "xHCI Host Controller" hash "prM+Jby/bFHCn2lNjQdAMbgc6tse3xVx+hZwjOPHSdQ=" parent-hash "rV9bfLq7c2eA4tYjVjwO4bxhm+y6GgZpl9J60L0fBkY=" with-interface 09:00:00 with-connect-type ""
        allow id 0b05:19af serial "9876543210" name "AURA LED Controller" hash "ivD4BdPa74ISz19OCKpiZy4RrkpyARqnN3oBXm49dnA=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" with-interface { ff:ff:ff 03:00:00 } with-connect-type "not used"
        allow id 046d:0aaf serial "2149SG005XR8_888-000316110306" name "Yeti X" hash "HmqnPrW8P9p5L+zCxos0yPVGC8ScpZqS8OERZGxWw9Q=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" with-interface { 01:01:00 01:02:00 01:02:00 01:02:00 01:02:00 03:00:00 } with-connect-type "hotplug"
        allow id 046d:c52b serial "" name "USB Receiver" hash "EhX4Eu+u69SQBRB41ITnKdTEt2jQjpsTHNbRfU35+QM=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-10" with-interface { 03:01:01 03:01:02 03:00:00 } with-connect-type "hotplug"
        allow id 05e3:0608 serial "" name "USB2.0 Hub" hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-11" with-interface 09:00:00 with-connect-type "not used"
        allow id 05e3:0608 serial "" name "USB2.0 Hub" hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-13" with-interface 09:00:00 with-connect-type "not used"
        allow id 0bda:5411 serial "" name "USB2.1 Hub" hash "JrnQAEQOFCw4rfvQjkGslWM1/Hbc3vKzAWT7760mI1c=" parent-hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" via-port "1-11.2" with-interface { 09:00:01 09:00:02 } with-connect-type "unknown"
        allow id 046d:c547 serial "" name "USB Receiver" hash "gFx7kcPo3OnfDcPhrJk3PxeBiF1o6/JGeTevInhob4A=" parent-hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" via-port "1-11.3" with-interface { 03:01:02 03:01:01 03:00:00 } with-connect-type "unknown"
        allow id 046d:c343 serial "38204108" name "G915 TKL LIGHTSPEED Wireless RGB Mechanical Gaming Keyboard" hash "wOoYIjtLvhooUN8KMxGildFj4zX1KIn9CJylE4pgwVY=" parent-hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" with-interface { 03:01:01 03:01:02 03:00:00 } with-connect-type "unknown"
        allow id 1b1c:0c1c serial "820730f0648871aaca52fff51091005f" name "CORSAIR iCUE Commander CORE" hash "lr0O1tI9otMWUZ9SD2CFJQzFRI5VcSDORS5FKqxYO0c=" parent-hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" with-interface { 03:00:00 03:00:00 } with-connect-type "hotplug"
        allow id 8087:0032 serial "" name "" hash "ClCa9utWpkfhSL14jLzpmilrrbre65+44YYBM4ysI/4=" parent-hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" via-port "1-13.4" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 } with-connect-type "hotplug"
        allow id 0bda:5412 serial "" name "USB2.1 Hub" hash "aHZxn+2vL0L+JWPJTei4SvJ73CFyH6fdpbYMTccFyTo=" parent-hash "JrnQAEQOFCw4rfvQjkGslWM1/Hbc3vKzAWT7760mI1c=" via-port "1-11.2.1" with-interface { 09:00:01 09:00:02 } with-connect-type "unknown"
        allow id 0414:a008 serial "200901010001" name "USB Audio" hash "h/AeB1pDOIHRCwYiVLn5xV+pNYhhm0LNkgPAuY0bJmo=" parent-hash "JrnQAEQOFCw4rfvQjkGslWM1/Hbc3vKzAWT7760mI1c=" with-interface { 01:01:00 01:02:00 01:02:00 } with-connect-type "unknown"
        allow id 048d:8295 serial "" name "ITE Device(8595)" hash "0Ce0vui79xSsDam5XB1ch8ePTHWZaaJhm3nW+95uUjU=" parent-hash "JrnQAEQOFCw4rfvQjkGslWM1/Hbc3vKzAWT7760mI1c=" via-port "1-11.2.4" with-interface 03:01:01 with-connect-type "unknown"
        allow id 0bda:1100 serial "" name "HID Device" hash "CSfaCwN7PxV4r3lixedS5SRSkt5CrxAWAUPOkTSZdro=" parent-hash "JrnQAEQOFCw4rfvQjkGslWM1/Hbc3vKzAWT7760mI1c=" via-port "1-11.2.5" with-interface 03:00:00 with-connect-type "unknown"
        allow id 046d:c094 serial "6EFB9182" name "PRO X Wireless" hash "R2n4+7shSxLVnokFaqYLICqzYcjylvKwoeZHGRa5bfg=" parent-hash "W6l+xvpLKIN6p2T3tTOGGy7Qm+zPESG43Fox/qV9OCE=" via-port "1-11.3" with-interface { 03:01:02 03:01:01 03:00:00 } with-connect-type "unknown"
        allow id 18d1:4ee1 serial "5A161FDCH001QU" name "Pixel 10 Pro" hash "kt8halcoC4acrofc0rkbTULafWQ4SB90b6RIBJgK6IA=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-8" with-interface 06:01:01 with-connect-type "hotplug"
      '';
    };
    vpn = {
      enable = true;
      addresses = [
        "192.168.4.11/32"
        "2a0c:b641:02c0:104::11/128"
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
        hl.workspace_rule({ workspace = "1",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "2",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "3",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "4",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "5",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "6",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "7",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "8",  monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "9",  monitor = "DP-2", persistent = true })
        hl.workspace_rule({ workspace = "10", monitor = "DP-2", persistent = true })
      ''
    ];
  };

  system.stateVersion = "24.05";
}
