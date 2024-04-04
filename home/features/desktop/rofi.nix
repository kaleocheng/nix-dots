{pkgs, ...}: {
  xdg.desktopEntries = {
    rofi-run = {
       name = "Run Application";
       icon = "rofi";
       genericName = "Run Application";
       terminal = false;
       categories = ["Application" "X-Xfce-Toplevel"];
       comment = "Launch Rofi";
       exec = "${pkgs.rofi}/bin/rofi -show combi";
    };
  };

  programs.rofi = {
    enable = pkgs.stdenv.isLinux;
    extraConfig = {
      show-icons = true;
      terminal = "kitty";
      display-drun = "";
      modi = "combi";
      combi-modi = "window,drun";
    };
    theme = ../../../config/rofi/theme-nord.rasi;
  };
}
