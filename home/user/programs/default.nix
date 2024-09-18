{ username, ... }:
{
  imports = [
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./starship.nix
    ./steam.nix
    ./vscode.nix
    ./zsh.nix
  ];
}