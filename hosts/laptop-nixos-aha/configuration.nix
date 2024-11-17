{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    ../../nixos/flavors/desktop/gnome
  ];

  # Enable OpenGL
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # fix the date sync issue in dual boot with win11
  time.hardwareClockInLocalTime = true;

  environment.systemPackages =
    with pkgs;
    [
    ];

  programs.ssh.startAgent = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
}
