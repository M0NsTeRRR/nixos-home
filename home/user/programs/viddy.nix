{ pkgs-unstable, ... }:
{
  imports = [ ./../../modules/viddy.nix ];

  programs.viddy = {
    enable = true;
    package = pkgs-unstable.viddy;
    settings = {
      general = {
        no_shell = false;
        shell = "zsh";
        shell_options = "--login";
        skip_empty_diffs = false;
        disable_mouse = false;
      };

      keymap = {
        timemachine_go_to_past = "Down";
        timemachine_go_to_more_past = "Shift-Down";
        timemachine_go_to_future = "Up";
        timemachine_go_to_more_future = "Shift-Up";
        timemachine_go_to_now = "Ctrl-Shift-Up";
        timemachine_go_to_oldest = "Ctrl-Shift-Down";
        scroll_left = "Left";
        scroll_right = "Right";
        scroll_up = "Up";
        scroll_down = "Down";
        scroll_half_page_up = "Ctrl-u";
        scroll_half_page_down = "Ctrl-d";
        scroll_page_up = "Ctrl-Up";
        scroll_page_down = "Ctrl-Down";
        scroll_bottom_of_page = "Shift-g";
        scroll_top_of_page = "g g";
      };

      color = {
        background = "white";
      };
    };
  };
}
