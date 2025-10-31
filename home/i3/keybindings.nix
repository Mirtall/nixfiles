{ lib, pkgs, modifier, config, ... }:
let
  alacritty = "${config.lib.nixGL.wrap pkgs.alacritty}/bin/alacritty";
in
lib.mkOptionDefault {
  "${modifier}+Shift+a" = "kill";
  "${modifier}+z" = "layout tabbed";
  "${modifier}+Return" = "exec --no-startup-id ${alacritty} -e zsh";

  # Rofi
  "${modifier}+d" = "exec --no-startup-id rofi -show drun";
  "${modifier}+Shift+f " = "exec --no-startup-id rofi -show window";
  "${modifier}+p" = "exec --no-startup-id rofi -show power-menu -modi power-menu:rofi-power-menu";

  "${modifier}+Shift+l" = "exec betterlockscreen -l -w ~/WallpaperLock.png;";
}
