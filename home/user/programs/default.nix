{ guiEnabled, ... }:
let
  defaultImports = [
    ./atuin.nix
    ./direnv.nix
    ./git.nix
    ./gpg.nix
    ./home-manager.nix
    ./k9s.nix
    ./kubecolor.nix
    ./../../modules/kubeswitch.nix
    ./starship.nix
    ./zsh.nix
  ];

  guiImports = [
    ./firefox.nix
    ./ghostty.nix
    ./hyprland.nix
    ./hyprpanel.nix
    ./obs.nix
    ./vscode.nix
  ];
in
{
  imports = defaultImports ++ (if guiEnabled then guiImports else [ ]);
  programs.kubeswitch = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      kind = "SwitchConfig";
      version = "v1alpha1";
      kubeconfigName = "*";
      kubeconfigStores = [
        {
          kind = "filesystem";
          paths = [
            "~/.kube/static-kubeconfigs/"
            "~/.kube/config"
          ];
        }
      ];
    };
  };
}
