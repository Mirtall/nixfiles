{ nixGL, ... }:
{
  programs.home-manager.enable = true;

  services.lorri.enable = true;
  services.dunst.enable = true;

  home = {
    stateVersion = "25.11";
    username = "ethan";
    homeDirectory = "/home/ethan";
  };

  nixGL.packages = nixGL.packages;

  imports = [
    ./alacritty.nix
    ./bat.nix
    ./firefox.nix
    ./git.nix
    ./gnupg.nix
    ./i3
    ./java.nix
    ./neovim.nix
    ./packages.nix
    ./picom.nix
    ./polybar
    ./rofi
    ./shell/bash.nix
    ./shell/zsh.nix
    ./ssh.nix
    ./vim
    # ./xresources.nix
  ];
}
