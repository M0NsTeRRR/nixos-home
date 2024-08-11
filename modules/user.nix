{
  users.users.lortega = {
    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "wheel"
      "input"
      "video"
      "render"
      "scanner"
      "lp"
    ];
  };
}