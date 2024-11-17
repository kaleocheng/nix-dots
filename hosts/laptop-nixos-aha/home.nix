{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
  nix = import ../../config/nix.nix;
in
{
  imports = [
    ../../home/flavors/desktop/gnome
    ../../home/flavors/application/development
    ../../home/flavors/application/workstation
  ];

  home.packages = with pkgs; [
    transmission-qt
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = nix.homeManagerStateVersion;
  };

}