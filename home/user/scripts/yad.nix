{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "list-bindings" ''
      yad --width=950 --height=550 \
      --center \
      --fixed \
      --title="Keybindings" \
      --no-buttons \
      --list \
      --column=Key: \
      --column=Description: \
      --column=Key: \
      --column=Description: \
      --timeout=90 \
      --timeout-indicat \
      " + Q" "Terminal" " + V" "Toogle floating" \
      " + C" "Kill active" " + R" "App menu" \
      " + M" "Exit" " + P" "Pseudo dwindle" \
      " + E" "File Manager" " J" "Toogle split" \

      " + <Number>" "Switch workspace" " + SHIFT + <Number>" "Move active window to a workspace" \
      " + <Scroll>" "Switch workspace" " + <Direction arrow>" "Move focus" \

      "PRINT" "Screenshot a region" \
    '')
  ];
}
