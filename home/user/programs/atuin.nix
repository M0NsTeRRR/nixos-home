{ pkgs-unstable, ... }:
{
  programs.atuin = {
    enable = true;
    package = pkgs-unstable.atuin;
    settings = {
      update_check = false;
      enter_accept = true;
    };
  };
}
