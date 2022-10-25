{ pkgs, ... } : {
  home.packages = with pkgs; [
    # dev packages
    jetbrains.idea-ultimate
    man-pages
    docker
    docker-compose
    pkg-config
    nodejs
    yarn
    git
    rnix-lsp
    man-pages
    tig
    ripgrep

    # communication
    discord
    slack
    thunderbird
    teams
    tdesktop

    # others
    gimp
    qemu
    direnv
    scrot
    unrar
    spotify
  ];
}
