{ ... }: {
  programs.bash = {
    enable = true;

    shellAliases = import ./aliases.nix;

    bashrcExtra = ''
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

      eval "$(direnv hook bash)"
    '';
  };
}
