{ username, ... }:
{
  imports = [
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./starship.nix
    ./vscode.nix
    ./k9s.nix
    ./kitty.nix
    ./zsh.nix
  ];
}