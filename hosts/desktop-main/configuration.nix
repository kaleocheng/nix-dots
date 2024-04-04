# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, ... }:

{
  imports =
  [
    ../../nixos/features/system
    ../../nixos/features/desktop
    ../../nixos/features/development
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    onlyoffice-bin
    calibre
  ];

  virtualisation.virtualbox.host.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  networking.hostName = "desktop-main";
  system.stateVersion = "24.05";
}

