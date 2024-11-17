{ pkgs, lib, ... }:
{
  imports = [
    ../../minimal
    ../../../features/fonts
    ../../../features/application/terminator.nix
  ];

  home.packages =
    with pkgs;
    mkLinuxOnly [
      gnome-disk-utility
      gnome-font-viewer # fonts
      papirus-icon-theme # icon
      rose-pine-gtk-theme
      pop-gtk-theme
      graphite-gtk-theme # GTK themes
      viewnior
      mate.atril # view image/ pdf
    ];
}
