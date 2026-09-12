{ pkgs-unstable, ... }:
{
  programs.gh = {
    enable = true;
    package = pkgs-unstable.gh;
    settings = {
      git_protocol = "ssh";
      telemetry = "disabled";
    };
  };
}
