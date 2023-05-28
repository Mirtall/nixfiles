{ pkgs, ... }: {
  home.packages = with pkgs; [
    # dev packages
    bintools-unwrapped
    jetbrains.idea-ultimate
    man-pages
    docker
    docker-compose
    pkg-config
    nodejs
    yarn
    git
    rnix-lsp
    nixpkgs-fmt
    man-pages
    tig
    ripgrep
    ghidra
    neovim

    # communication
    discord
    slack
    thunderbird
    teams
    tdesktop
    slrn

    # others
    gimp
    qemu
    direnv
    scrot
    unrar
    spotify
    tree
    evince
    prismlauncher
    unzip
    notion-app-enhanced
    openvpn
    networkmanagerapplet
    feh
    pavucontrol
    file
    wireguard-tools
    nmap
    arandr
    htop
    picom
  ];
}
