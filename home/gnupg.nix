{ pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
  };

  programs = {
    gpg = { enable = true; };
  };
}
