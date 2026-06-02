{
  lib,
  guiEnabled,
  wslEnabled,
  ...
}:
let
  defaultImports = [
    ./gpg.nix
  ];

  guiImports = [
    ./kdeconnect.nix
  ];

  sshAgentImports = if wslEnabled then [ ] else [ ./ssh-agent.nix ];
in
{
  imports = defaultImports ++ lib.optionals guiEnabled guiImports ++ sshAgentImports;
}
