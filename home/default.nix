{
  pkgs,
  home-manager-unstable,
  hyprpanel,
  username,
  ...
}:
{
  disabledModules = [ "programs/firefox.nix" ];

  imports = [
    (home-manager-unstable + "/modules/programs/firefox.nix")
    ./user
    (hyprpanel.packages."${pkgs.system}".default)
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.stateVersion = "24.05";
}
