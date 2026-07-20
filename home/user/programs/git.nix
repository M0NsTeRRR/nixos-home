{ pkgs-unstable, mySystem, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs-unstable.git;
    settings = {
      user = {
        name = "Ludovic Ortega";
        email = mySystem.git.email;
      };
      core.editor = "vi";
      ui.color = true;
      merge.conflictStyle = "zdiff3";
      push.autoSetupRemote = true;
      pull.ff = "only";
    };
    signing = {
      key = mySystem.git.signingKey;
      signByDefault = true;
    };
  };
}
