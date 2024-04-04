{
  description = "Kaleo NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    homeConfigurations."kaleo@mbp" = home-manager.lib.homeManagerConfiguration {
     pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config = {
          allowUnfree = true;
        };
     };
     modules = [
        ./hosts/laptop-mbp-m1/home.nix
     ];
    };

    homeConfigurations."kaleo@debian" = home-manager.lib.homeManagerConfiguration {
     pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
        };
     };
     modules = [
        ./hosts/laptop-thinkpad-x61/home.nix
     ];
    };

    nixosConfigurations."live-desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ./hosts/live-desktop/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.kaleo = import ./hosts/live-desktop/home.nix;
        }
      ];
    };

    nixosConfigurations."desktop-main" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/desktop-main/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.kaleo = import ./hosts/desktop-main/home.nix;
        }
      ];
    };
  };
}
