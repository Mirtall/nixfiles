{ lib, pkgs, modifier, ... }:
let
  terminal = "${pkgs.alacritty}/bin/alacritty";
in
lib.mkOptionDefault {
  "${modifier}+Shift+a" = "kill";
  "${modifier}+z" = "layout tabbed";
  "${modifier}+Return" = "exec ${terminal}";

  # Rofi
  "${modifier}+d" = "exec --no-startup-id rofi -show drun";
  "${modifier}+Shift+f " = "exec --no-startup-id rofi -show window";
  "${modifier}+p" = "exec --no-startup-id rofi -show power-menu -modi power-menu:rofi-power-menu";

  "${modifier}+Shift+l" = "exec i3lock -i ~/WallpaperLock.png;";
}
