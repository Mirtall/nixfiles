{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "Monokai Extended";
      pager = "less -FR";
    };
  };
}
