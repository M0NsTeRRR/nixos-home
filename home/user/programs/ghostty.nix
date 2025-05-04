{ pkgs-unstable, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs-unstable.ghostty;
    enableZshIntegration = true;
    settings = {
      font-size = 12;
      background-opacity = 0.8;
    };
  };
}
