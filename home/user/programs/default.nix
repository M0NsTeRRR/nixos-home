{ guiEnabled, ... }:
let
  defaultImports = [
    ./atuin.nix
    ./delta.nix
    ./git.nix
    ./gpg.nix
    ./home-manager.nix
    ./hwatch.nix
    ./k9s.nix
    ./keepassxc.nix
    ./kubecolor.nix
    ./kubeswitch.nix
    ./onlyoffice.nix
    ./opencode.nix
    ./rclone.nix
    ./shell.nix
    ./starship.nix
    ./tealdeer.nix
    ./trippy.nix
    ./uv.nix
  ];

  guiImports = [
    ./firefox.nix
    ./ghostty.nix
    ./hyprland.nix
    ./noctalia.nix
    ./obs.nix
    ./vscode.nix
  ];
in
{
  imports = defaultImports ++ (if guiEnabled then guiImports else [ ]);
}
