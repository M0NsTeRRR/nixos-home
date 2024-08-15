{ config, username, ... }:

{
  imports = [
    ./user
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.stateVersion = "24.05";
}