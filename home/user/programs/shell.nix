{ pkgs-unstable, ... }:
{
  home.shellAliases = {
    cat = "bat --paging=never";
    watch = "hwatch";
    ls = "eza";
    k = "kubectl";
    top = "btop";
    jq = "yq";
    tree = "lstr --icons";
    dig = "kdig";
  };

  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;

    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
