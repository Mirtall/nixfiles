{ pkgs, config, lib, ... }:
let
  modifier = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

    config = {
      modifier = "Mod4"; # Window key
      keybindings = import ./keybindings.nix { inherit lib; };
    };
  };

  home.packages = [
    pkgs.i3lock
    pkgs.i3status
  ];
}
