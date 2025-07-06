{ pkgs-unstable, guiEnabled, ... }:
let
  defaultImports = [
    ./atuin.nix
    ./git.nix
    ./gpg.nix
    ./home-manager.nix
    ./k9s.nix
    ./kubecolor.nix
    ./../../modules/kubeswitch.nix
    ./starship.nix
    ./tealdeer.nix
    ./../../modules/trippy.nix
    ./../../modules/viddy.nix
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
    package = pkgs-unstable.kubeswitch;
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

  programs.trippy = {
    enable = true;
    package = pkgs-unstable.trippy;
    settings = {
      tui = {
        tui-locale = "en";
      };
      strategy = {
        addr-family = "system";
      };
    };
  };

  programs.viddy = {
    enable = true;
    package = pkgs-unstable.viddy;
    settings = {
      general = {
        no_shell = false;
        shell = "zsh";
        shell_options = "";
        skip_empty_diffs = false;
        disable_mouse = false;
      };

      keymap = {
        timemachine_go_to_past = "Down";
        timemachine_go_to_more_past = "Shift-Down";
        timemachine_go_to_future = "Up";
        timemachine_go_to_more_future = "Shift-Up";
        timemachine_go_to_now = "Ctrl-Shift-Up";
        timemachine_go_to_oldest = "Ctrl-Shift-Down";
        scroll_left = "Left";
        scroll_right = "Right";
        scroll_up = "Up";
        scroll_down = "Down";
        scroll_half_page_up = "Ctrl-u";
        scroll_half_page_down = "Ctrl-d";
        scroll_page_up = "Ctrl-Up";
        scroll_page_down = "Ctrl-Down";
        scroll_bottom_of_page = "Shift-g";
        scroll_top_of_page = "g g";
      };

      color = {
        background = "white";
      };
    };
  };
}
