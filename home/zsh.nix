{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    shellAliases = {
      cat = "bat";
      remi = "nmcli connection up Remi";
      dtc = "docker run -v ~/dev/epita/tiger/tc:/tc/ --rm -it --user 1000 tiger:stable";
      toto = "mkdir toto && cd toto && linit $1";
    };

    initExtra = ''
      function linit {
        if [ $# -eq 0 ]; then
          lorri init && direnv allow
        else
          cp ~/dev/nix/shells/$1/shell.nix . && lorri init && direnv allow
        fi
      }

      function tsize {
        printf '\33]50;%s\007' "xft:mono:size=$1"
      }

      eval "$(direnv hook zsh)"

      export PGDATA="$HOME/postgres_data"
      export PGHOST="/tmp"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "kafeitu";
    };
  };
}
