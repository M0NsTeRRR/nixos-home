{ pkgs-unstable, ... }:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    package = pkgs-unstable.delta;
    options = {
      line-color = true;
      navigate = true;
      hyperlinks = true;
    };
  };
}
