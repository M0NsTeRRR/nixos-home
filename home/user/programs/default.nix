{ username, ... }:
{
  imports = [
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./starship.nix
    ./vscode.nix
    ./kitty.nix
    ./zsh.nix
  ];
}