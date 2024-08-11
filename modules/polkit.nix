{ pkgs, username, ... }:
{
  security = {
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