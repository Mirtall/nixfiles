{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = import ../aliases.nix;
    initContent = ''
      function linit {
        if [ $# -eq 0 ]; then
          lorri init && direnv allow
        else
          cp ~/dev/nix/shells/$1/shell.nix . && lorri init && direnv allow
        fi
      }

      eval "$(direnv hook zsh)"

      source ~/.p10k.zsh
    '';


    oh-my-zsh = {
      enable = true;
      theme = "kafeitu";
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
  };
}
