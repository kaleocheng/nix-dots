{ pkgs, ... }: {
  imports = [
    ./common.nix
    ./lua.nix
    ./nodejs.nix
    ./python.nix
    ./go.nix
    ./devops.nix
  ];
}
