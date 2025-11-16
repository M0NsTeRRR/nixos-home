{ pkgs-unstable, ... }:
{
  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      cat = "bat --paging=never";
      watch = "hwatch";
      ls = "eza";
      k = "kubectl";
      top = "btop";
      jq = "yq";
    };
  };
}
