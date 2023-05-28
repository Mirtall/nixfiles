{
  description = "My nix config";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-22.11";
    };
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };
  };

  outputs =
    { self
    , flake-utils
    , nixpkgs
    , home-manager
    , ...
    }@inputs:
    let
      system = "x86_64-linux";

      get_modules = machine:
        [
          ./hosts/${machine}
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.verbose = true;
            home-manager.users = {
              ethan = import ./home;
            };
          }
        ];

      gen_config = machine:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = get_modules "${machine}";
        };
    in
    {
      nixosConfigurations = {
        laptop = gen_config "laptop";

        desktop = gen_config "desktop";
      };
    };
}
