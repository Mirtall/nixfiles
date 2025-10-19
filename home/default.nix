{ pkgs, machine, ... }:
{
  programs.home-manager.enable = true;

  services.lorri.enable = true;
  services.dunst.enable = true;

  home = rec {
    stateVersion = "25.11";
    username = "ethan";
    homeDirectory = "/home/${username}";
  };

  imports = [
    # ./alacritty/alacritty.nix
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
    ./urxvt.nix
    ./neovim.nix
    ./vim
    ./xresources.nix
    ./zsh.nix
  ];
}
