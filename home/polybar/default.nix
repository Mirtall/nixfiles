{ pkgs, ... }: {
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3Support = true;
      # githubSupport = true;
    };

    config = ./config.ini;

    script = ''
      killall -q polybar
      polybar
    '';
  };
}
