{ config, pkgs, ... }: {
    imports = [
        ./packages.nix
        ./git.nix
        ./vim.nix
        ./bash.nix
        ./urxvt.nix
        ./bat.nix
        ./java.nix
    ];

    programs.home-manager.enable = true;
    home.username = "ethan";
    home.homeDirectory = "/home/ethan";

    services.lorri.enable = true;

    nixpkgs.config.allowUnfree = true;

    programs = {
        firefox.enable = true;
    };


    home.stateVersion = "22.05";
}

