{ guiEnabled, ... }:
let
  defaultImports = [
    ./atuin.nix
    ./home-manager.nix
    ./k9s.nix
    ./gpg.nix
    ./git.nix
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
  imports = defaultImports ++ (if guiEnabled then guiImports else []);
}
