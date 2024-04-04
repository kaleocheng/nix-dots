# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./users.nix
    ./nix.nix
    ./language.nix
  ];
  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  time.timeZone = "Asia/Shanghai";

  security = {
    sudo = {
      wheelNeedsPassword = false;
    };
  };
}

