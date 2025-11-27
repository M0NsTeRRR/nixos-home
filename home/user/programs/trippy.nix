{ pkgs-unstable, ... }:
{
  programs.trippy = {
    enable = true;
    package = pkgs-unstable.trippy;
    settings = {
      strategy = {
        addr-family = "system";
      };
    };
  };
}
