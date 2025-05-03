{ pkgs-unstable, ... }:
{
  programs = {
    obs-studio = {
      enable = true;
      package = pkgs-unstable.obs-studio;
      plugins = with pkgs-unstable.obs-studio-plugins; [
        wlrobs
        obs-vaapi
        droidcam-obs
        obs-vkcapture
        obs-gstreamer
        obs-3d-effect
        input-overlay
        obs-multi-rtmp
        obs-source-clone
        obs-shaderfilter
        obs-source-record
        obs-livesplit-one
        obs-command-source
        obs-move-transition
        obs-pipewire-audio-capture
      ];
    };
  };
}
