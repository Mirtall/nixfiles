{ config, pkgs, ... }: {
    imports = [
        ./packages.nix
        ./git.nix
        ./vim.nix
        ./bash.nix
        ./urxvt.nix
        ./bat.nix
        ./java.nix
        ./firefox.nix
    ];

    programs.home-manager.enable = true;
    home.username = "ethan";
    home.homeDirectory = "/home/ethan";

    services.lorri.enable = true;
    services.dunst.enable = true;

    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
}

