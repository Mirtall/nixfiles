{ pkgs, ... } : {
    home.packages = with pkgs; [

        # dev packages
        jetbrains.idea-ultimate
        docker
        docker-compose
        pkg-config
        nodejs
        yarn
        git

        # communication
        discord
        slack
        thunderbird
        teams

        # others
        gimp
        qemu
        direnv
        dunst
        scrot
    ];
}

