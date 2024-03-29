{ pkgs, machine, ... }:
let
  termsizes = {
    laptop = 6;
    desktop = 12;
  };

  size = termsizes."${machine}";
in
{
  programs.home-manager.enable = true;

  services.lorri.enable = true;
  services.dunst.enable = true;

  home = rec {
    stateVersion = "23.05";
    username = "ethan";
    homeDirectory = "/home/${username}";
  };

  imports = [
    (import ./alacritty.nix { inherit pkgs size; })
    ./bash.nix
    ./bat.nix
    ./firefox.nix
    ./fonts.nix
    ./git.nix
    ./gnupg.nix
    ./i3
    ./polybar
    ./java.nix
    ./packages.nix
    ./picom.nix
    ./rofi
    ./ssh.nix
    ./urxvt.nix
    ./neovim.nix
    ./vim
    ./xresources.nix
    ./zsh.nix
  ];
}
