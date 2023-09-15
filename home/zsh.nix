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

      eval "$(direnv hook zsh)"

      export SSH_AUTH_SOCK="$(${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "kafeitu";
    };
  };
}
