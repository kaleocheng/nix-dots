{
  description = "Nix Dotsfiles with flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:

    let
      hosts = import ./config/hosts.nix;

      mkHomeConfigurations =
        {
          host,
          nixpkgs,
          home-manager,
          modules ? [ ],
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = host.arch;
            config = {
              allowUnfree = true;
            };
          };
          modules = [
            ./hosts/${host.dir}/home.nix
            ./overlays
          ] ++ modules;
        };

      mkNixOSConfigurations =
        {
          host,
          nixpkgs,
          home-manager,
          modules ? [ ],
          overlays ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = host.arch;
          modules = [
            ./hosts/${host.dir}/configuration.nix
            ./overlays
            { nixpkgs.overlays = overlays; }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users."${host.user}" = import ./hosts/${host.dir}/home.nix;
            }
          ] ++ modules;
        };

    in

    {
      nixosConfigurations."${hosts.workstation.hostname}" = mkNixOSConfigurations {
        host = hosts.workstation;
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };
      nixosConfigurations."${hosts.aha.hostname}" = mkNixOSConfigurations {
        host = hosts.aha;
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };
      nixosConfigurations."${hosts.gateway.hostname}" = mkNixOSConfigurations {
        host = hosts.gateway;
        nixpkgs = inputs.nixpkgs-stable;
        home-manager = inputs.home-manager-stable;
      };

      homeConfigurations."${hosts.work.user}@${hosts.work.hostname}" = mkHomeConfigurations {
        host = hosts.work;
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };

      homeConfigurations."${hosts.wsl.hostname}" = mkHomeConfigurations {
        host = hosts.wsl;
        nixpkgs = inputs.nixpkgs-stable;
        home-manager = inputs.home-manager-stable;
      };
    };
}
