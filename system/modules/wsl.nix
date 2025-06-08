{ username, ... }:

{
  environment.etc."wsl.conf".text = ''
    [user]
    default=${username}
  '';
}
