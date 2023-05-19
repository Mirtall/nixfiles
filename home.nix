{ config, pkgs, ... }: {
  imports = [
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
    ./urxvt.nix
    ./vim.nix
    ./xresources.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";

  # FIXME: own files
  services.lorri.enable = true;
  services.dunst.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "22.11";
}
