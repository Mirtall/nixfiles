{ pkgs, ... }: {
  programs.rofi = {
    enable = true;

    theme = ./nord.rasi;
  };

  home.packages = [ pkgs.rofi-power-menu ];
}
