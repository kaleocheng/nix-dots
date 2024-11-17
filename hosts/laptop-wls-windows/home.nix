{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
  nix = import ../../config/nix.nix;

in
{
  imports = [
    ../../home/flavors/desktop/minimal
    ../../home/flavors/application/development
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = nix.homeManagerStateVersion;
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
