{ pkgs, ... }: {
  home.packages = with pkgs; [
    # dev packages
    bintools-unwrapped
    jetbrains.idea-ultimate
    docker
    docker-compose
    pkg-config
    nodejs
    yarn
    git
    nil
    nixpkgs-fmt
    man-pages
    tig
    ripgrep
    ghidra
    stylua
    fzf
    fd
    postgresql
    openssl
    curlFull.dev

    # communication
    discord
    slack
    thunderbird
    tdesktop

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
    picom
    qbittorrent
    vlc
    htop
  ];
}
