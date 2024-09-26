{
  pkgs,
  home-manager-unstable,
  username,
  ...
}:
{
  disabledModules = [ "programs/firefox.nix" ];

  imports = [
    (home-manager-unstable + "/modules/programs/firefox.nix")
    ./user
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.stateVersion = "24.05";
}
