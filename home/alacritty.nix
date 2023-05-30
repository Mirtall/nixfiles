{ pkgs, size, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling = {
        history = 1000;
        multiplier = 4;
      };

      font = {
        inherit size;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
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

      shell.program = "${pkgs.zsh}/bin/zsh";
    };
  };
}
