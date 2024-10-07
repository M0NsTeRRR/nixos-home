{ pkgs, ... }:
{
  systemd.user.services.ssh-agent = {
    Unit = {
      Description = "SSH Agent";
      ConditionUser = "!@system";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/rm -f %t/ssh-agent";
      ExecStart = "${pkgs.openssh}/bin/ssh-agent -a %t/ssh-agent";
      StandardOutput = "null";
      Type = "forking";
      Restart = "on-failure";
      SuccessExitStatus = "0 2";
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent";
  };
}
