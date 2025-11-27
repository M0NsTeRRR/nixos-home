{ pkgs-unstable, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs-unstable.git;
    settings = {
      user = {
        name = "Ludovic Ortega";
        email = "ludovic.ortega@adminafk.fr";
      };
      core.editor = "vi";
      ui.color = true;
      merge.conflictStyle = "zdiff3";
      push.autoSetupRemote = true;
      pull.ff = "only";
    };
    signing = {
      key = "81E390A404C7D583A6D6958E22F86C9B1BEC401D";
      signByDefault = true;
    };
  };
}
