{ pkgs, lib, ... }:
{

  home.packages =
    with pkgs;
    [
      localsend
    ]
    ++ mkLinuxOnly [
      dropbox
      netease-cloud-music-gtk
      wechat-uos
      teams-for-linux
      todoist-electron
      kcolorchooser # color picker
      slack
      google-chrome
      remmina # Remote VNC
    ];
}
