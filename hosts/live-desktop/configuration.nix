# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
  [
    ../../nixos/features/system
    ../../nixos/features/desktop/devices.nix
    ../../nixos/features/desktop/file.nix
    ../../nixos/features/desktop/input.nix
    ../../nixos/features/desktop/xserver.nix
    ../../nixos/features/desktop/web.nix
    ../../nixos/features/development
  ];

  hardware.pulseaudio.enable = lib.mkForce false;
  networking.networkmanager.enable = lib.mkForce false;
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "nixos-desktop";
  system.stateVersion = "24.05";
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}

