{ pkgs, ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      cat = "bat";
      remi = "nmcli connection up Remi";
      dtc = "docker run -v ~/dev/epita/tiger/tc:/tc/ --rm -it --user 1000 tiger:stable";
    };

    bashrcExtra = ''
      function linit {
        if [ $# -eq 0 ]; then
          lorri init && direnv allow
        else
          cp ~/dev/nix/shells/$1/shell.nix . && lorri init && direnv allow
        fi
      }

      eval "$(direnv hook bash)"

      export PGDATA="$HOME/postgres_data"
      export PGHOST="/tmp"
    '';
  };
}
