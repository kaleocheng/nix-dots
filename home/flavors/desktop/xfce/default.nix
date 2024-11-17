{ pkgs, lib, ... }:
{
  imports = [
    ../minimal
    ../../../features/application/conky.nix
    ../../../features/application/picom.nix
    ../../../features/application/xfce.nix
    ../../../features/application/rofi.nix
  ];
  home.packages = with pkgs; [
    plank
  ];
}
