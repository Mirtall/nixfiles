{ pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
    defaultCacheTtl = 7200;
  };

  programs = {
    gpg = { enable = true; };
  };
}
