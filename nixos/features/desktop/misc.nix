{pkgs, ...}: {
  environment.systemPackages = with pkgs;[
    gnome.gnome-disk-utility
    kcolorchooser # color picker
    gimp
    papirus-icon-theme #icon
    remmina # remote desktop
    rose-pine-gtk-theme pop-gtk-theme graphite-gtk-theme # GTK themes
  ];
}
