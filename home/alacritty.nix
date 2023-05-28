{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling = {
        history = 1000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 6;
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
