{ pkgs, ... }:
{
  security = {
    sudo.wheelNeedsPassword = false;
    apparmor = {
      enable = true;
      packages = with pkgs; [
        apparmor-utils
        apparmor-profiles
      ];
    };
    polkit = {
      enable = true;
      extraConfig = ''
        /* Log authorization checks. */
        polkit.addRule(function(action, subject) {
          polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
        });       
      '';
    };
  };
}
