{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
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
    stateVersion = "24.11";
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
