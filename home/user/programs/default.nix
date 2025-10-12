{ guiEnabled, ... }:
let
  defaultImports = [
    ./atuin.nix
    ./git.nix
    ./gpg.nix
    ./home-manager.nix
    ./hwatch.nix
    ./k9s.nix
    ./kubecolor.nix
    ./kubeswitch.nix
    ./starship.nix
    ./tealdeer.nix
    ./trippy.nix
    ./uv.nix
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
}
