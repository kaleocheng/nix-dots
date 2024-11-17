{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    ../../nixos/hardware/gpu/nvidia.nix
    ../../nixos/flavors/desktop/xfce
  ];

  # Enable OpenGL
  hardware.graphics.enable = true;

  # fix the date sync issue in dual boot with win11
  time.hardwareClockInLocalTime = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    calibre
    onlyoffice-bin
  ];

  programs.ssh.startAgent = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  system.stateVersion = "24.11";
}
