{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dropbox
  ];

  programs.file-roller.enable = true;
  programs.thunar.plugins = with pkgs; [
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.xfce4-sensors-plugin
      xfce.xfce4-netload-plugin
  ];
}
