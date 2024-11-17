{ pkgs, ... }:
{
  imports = [
    ./mouse.nix
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
