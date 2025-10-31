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
    ./bash.nix
    ./bat.nix
    ./firefox.nix
    ./git.nix
    ./gnupg.nix
    ./i3
    ./polybar
    ./java.nix
    ./packages.nix
    ./picom.nix
    ./rofi
    ./ssh.nix
    ./neovim.nix
    ./vim
    ./xresources.nix
    ./zsh.nix
  ];
}
