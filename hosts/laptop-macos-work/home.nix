{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
  nix = import ../../config/nix.nix;

in
{
  imports = [
    ../../home/flavors/desktop/minimal
    ../../home/flavors/application/development
    ../../home/flavors/application/workstation
  ];

  home = {
    username = users.work;
    homeDirectory = "/Users/${users.work}";
    stateVersion = nix.homeManagerStateVersion;
    sessionPath = [
      "/opt/homebrew/bin"
    ];
    sessionVariables = {
      SHELL = "/opt/homebrew/bin/bash";
    };
    packages = with pkgs; [
      tesseract
      postgresql
    ];
  };
}
