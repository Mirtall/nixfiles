{ config, pkgs, ... }: {
    imports = [
        ./packages.nix
        ./git.nix
    ];

    programs.home-manager.enable = true;
    home.username = "ethan";
    home.homeDirectory = "/home/ethan";

    services.lorri.enable = true;

    nixpkgs.config.allowUnfree = true;

    programs = {
        firefox.enable = true;

        java = {
            enable = true;
            package = pkgs.jdk;
        };
    };

    home.stateVersion = "22.05";
}

