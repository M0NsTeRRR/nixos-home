{
  imports = [
    hyprland.nixosModules.default
    ./dns
    ./docker
    ./gpg
    ./internationalization
    ./polkit
    ./printer
    ./security
    ./ssh
    ./user
  ];
}