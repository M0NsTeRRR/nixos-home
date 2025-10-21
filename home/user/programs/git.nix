{ pkgs-unstable, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs-unstable.git;
    userName = "Ludovic Ortega";
    userEmail = "ludovic.ortega@adminafk.fr";
    signing = {
      key = "81E390A404C7D583A6D6958E22F86C9B1BEC401D";
      signByDefault = true;
    };
    delta = {
      enable = true;
      package = pkgs-unstable.delta;
      options = {
        line-color = true;
        navigate = true;
        hyperlinks = true;
      };
    };
    extraConfig = {
      core.editor = "vi";
      ui.color = true;
      merge.conflictStyle = "zdiff3";
      push.autoSetupRemote = true;
      pull.ff = "only";
    };
  };
}
