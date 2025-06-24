{ pkgs-unstable, ... }:
{
  programs.tealdeer = {
    enable = true;
    package = pkgs-unstable.tealdeer;
    settings = {
      display = {
        use_pager = true;
      };
      updates = {
        auto_update = true;
        auto_update_interval_hours = 24;
      };
    };
  };
}
