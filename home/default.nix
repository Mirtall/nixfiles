{ config, ... }:

{
  programs.home-manager.enable = true;

  services.lorri.enable = true;
  services.dunst.enable = true;

  home = rec {
    stateVersion = "22.11";
    username = "ethan";
    homeDirectory = "/home/${username}";
  };

  imports = [
    ./alacritty.nix
    ./bash.nix
    ./bat.nix
    ./firefox.nix
    ./fonts.nix
    ./git.nix
    ./gnupg.nix
    ./i3
    ./java.nix
    ./packages.nix
    ./rofi
    ./ssh.nix
    ./urxvt.nix
    ./vim
    ./xresources.nix
    ./zsh.nix
  ];
}
