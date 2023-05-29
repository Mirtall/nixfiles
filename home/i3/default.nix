{ pkgs, config, lib, ... }:
let
  modifier = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      modifier = "Mod4"; # Window key
      defaultWorkspace = "1";
      keybindings = import ./keybindings.nix { inherit lib pkgs; };

      window = {
        border = 3;
      };

      gaps = {
        smartBorders = "on";
        inner = 7;
        outer = 2;
      };
    };

    extraConfig = ''
      exec --no-startup-id picom
    '';
  };

  home.packages = [
    pkgs.i3lock
    pkgs.i3status
  ];
}
