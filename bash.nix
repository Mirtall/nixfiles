{ pkgs, ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      cat = "bat";
    };

    bashrcExtra = ''
      function linit {
        if [ $# -eq 0 ]; then
          lorri init && direnv allow
        else
          cp ~/dev/nix-stuffs/shells/$1/shell.nix . && lorri init && direnv allow
        fi
      }

      eval "$(direnv hook bash)"
    '';
  };
}
