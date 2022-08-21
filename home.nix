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

    # FIXME: own files
    services.lorri.enable = true;
    services.dunst.enable = true;
    services.xcape.enable = true;

    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
}
