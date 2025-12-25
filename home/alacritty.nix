{ pkgs, config, ... }:
{
  programs.alacritty = {
    enable = true;
    package =
      (config.lib.nixGL.wrap pkgs.alacritty);
    theme = "nord";
    settings = {
      scrolling = {
        history = 1000;
        multiplier = 4;
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 6.0;
      };

      cursor = {
        style = "Block";
        vi_mode_style = "Block";
        unfocused_hollow = true;
        thickness = 0.15;
      };

      window = {
        opacity = 0.8;
      };

      terminal.shell = "${pkgs.zsh}/bin/zsh";
    };
  };
}
