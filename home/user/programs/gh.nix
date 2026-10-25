{ pkgs-unstable, ... }:
{
  programs.gh = {
    enable = true;
    package = pkgs-unstable.gh;
    extensions = [
      pkgs-unstable.gh-actions-lock
    ];
    settings = {
      git_protocol = "ssh";
      telemetry = "disabled";
    };
  };
}
