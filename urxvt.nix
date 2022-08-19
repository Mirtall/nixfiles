{ pkgs, ... }: {
  programs.urxvt = {
    enable = true;

    fonts = [ "xft:bitstream vera sans mono:size=10:antialias=true" ];
    transparent = true;
    shading = 20;
    iso14755 = false;
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
