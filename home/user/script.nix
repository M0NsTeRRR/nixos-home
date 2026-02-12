{
  lib,
  guiEnabled,
  ...
}:
let

  guiScripts = [ ];
in
{
  home.packages = [ ] ++ lib.optionals guiEnabled guiScripts;
}
