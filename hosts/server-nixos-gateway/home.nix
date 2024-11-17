{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
  nix = import ../../config/nix.nix;
in
{
  imports = [
    ../../home/flavors/minimal
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = nix.homeManagerStateVersion;
  };
}
