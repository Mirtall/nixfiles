{ pkgs, ... }: {
  programs.urxvt = {
    enable = true;

    fonts = [ "xft:JetBrainsMono Nerd Font:size=10:antialias=true" ];
    transparent = true;
    shading = 20;
    iso14755 = true;
    scroll.bar.enable = false;

    extraConfig = {
      "tintColor" = "white";
      "urgentOnBell" = true;
      "depth" = 24;
      "lineSpace" = 0;
      "geometry" = "92x24";
      "cursorBlink" = true;
      "cursorUnderline" = false;
    };
  };
}
