{ pkgs-unstable, ... }:
{
  programs.atuin = {
    enable = true;
    package = pkgs-unstable.atuin;
    enableZshIntegration = true;
    settings = {
      update_check = false;
      enter_accept = true;
    };
  };
}
