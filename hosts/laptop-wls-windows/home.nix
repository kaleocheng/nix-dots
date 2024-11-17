{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;

in
{
  imports = [
    ../../home/flavors/desktop/minimal
    ../../home/flavors/application/development
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = "24.11";
    sessionPath =
      [
      ];
    sessionVariables =
      {
      };
    packages =
      with pkgs;
      [
      ];
  };
}
