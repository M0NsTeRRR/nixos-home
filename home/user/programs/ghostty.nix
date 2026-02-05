{ pkgs-unstable, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs-unstable.ghostty;
    settings = {
      font-size = 12;
      background-opacity = 0.8;
      shell-integration-features = "no-cursor,sudo,title,ssh-env";
    };
  };
}
