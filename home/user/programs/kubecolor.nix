{ pkgs-unstable, ... }:
{
  programs.kubecolor = {
    enable = true;
    package = pkgs-unstable.kubecolor;
    enableAlias = true;
  };
}
