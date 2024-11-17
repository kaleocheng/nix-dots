{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
in
{
  imports = [
    ../../home/flavors/minimal
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = "24.11";
  };
}
