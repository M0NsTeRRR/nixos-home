{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
let
  wslEnabled = if config ? wsl then config.wsl.enable else false;

  allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "google-chrome"
      "spotify"
      "vscode"
      "vscode-extension-ms-vscode-remote-remote-ssh"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "vscode-extension-MS-python-vscode-pylance"
    ];

  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfreePredicate = allowUnfreePredicate;
  };
in
{
  imports = [
    inputs.home-manager-stable.nixosModules.home-manager
    ../options.nix
  ];

  config = {
    home-manager = {
      backupFileExtension = "backup";
      useUserPackages = true;

      extraSpecialArgs = {
        inherit
          inputs
          pkgs-unstable
          wslEnabled
          ;
        username = config.mySystem.user.name;
        guiEnabled = !wslEnabled && config.mySystem.gui.enable;
        batteryEnabled = config.mySystem.battery.enable;
        nvidiaEnabled = lib.elem "nvidia" config.services.xserver.videoDrivers;
      };

      users.${config.mySystem.user.name} = {
        disabledModules = [ "programs/fish.nix" ];
        imports = [
          (inputs.home-manager-unstable + "/modules/programs/devenv.nix")
          (inputs.home-manager-unstable + "/modules/programs/fish.nix")
          ./user
        ]
        ++ lib.optionals (inputs ? noctalia) [
          inputs.noctalia.homeModules.default
        ];

        nixpkgs.config.allowUnfreePredicate = allowUnfreePredicate;

        home = {
          username = "${config.mySystem.user.name}";
          homeDirectory = "/home/${config.mySystem.user.name}";
        };

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        home.stateVersion = "24.05";
      };
    };
  };
}
