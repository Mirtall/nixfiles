{
  description = "Home Manager configuration of ethan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL.url = "github:nix-community/nixGL";
  };

  outputs =
    { nixpkgs, home-manager, nixGL, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations."ethan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home ];

        extraSpecialArgs = {
          inherit nixGL;
        };
      };
    };
}
