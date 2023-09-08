{ pkgs, config, lib, ... }:
let
  modifier = "Mod4"; # Super key
in
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      inherit modifier;
      defaultWorkspace = "1";
      keybindings = import ./keybindings.nix { inherit lib pkgs modifier; };

      window = {
        border = 3;
      };

      gaps = {
        smartBorders = "on";
        inner = 7;
        outer = 2;
      };
    };
  };

  home.packages = [
    pkgs.i3lock
    pkgs.i3status
  ];
}
