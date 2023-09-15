{ config, lib, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    # enableSshSupport = true;
    # pinentryFlavor = "tty";
    # defaultCacheTtl = 3600;
  };

  programs = {
    gpg = { enable = true; };
  };
}
