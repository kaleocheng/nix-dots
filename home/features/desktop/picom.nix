{pkgs, ...}: {
  services.picom = {
    enable = pkgs.stdenv.isLinux;
    backend = "glx";
    shadow = true;
    shadowOpacity = 0.4;
    shadowExclude = [
      "n:e:xfce4-notifyd"
      "_GTK_FRAME_EXTENTS@:c"
    ];
    wintypes = {
      tooltip = { fade = true; shadow = false; opacity = 0.95;  };
      popup_menu = {opacity = 0.95; shadow=false;};
      menu = {opacity = 0.95; shadow=false;};
      dropdown_menu = {opacity = 0.95; shadow = false;};
      dock = {shadow = false;};
      dnd = {shadow = true;};
    };
    settings = {
      blur = {
        method = "dual_kawase";
        strength = 3;
      };
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'popup_menu'"
        "window_type = 'dropdown_menu'"
        "window_type = 'tooltip'"
        "window_type = 'menu'"
        "class_g = 'Xfce4-screenshooter'"
        "class_g = 'firefox'"
        "class_g = 'google-chrome'"
      ];
    };
  };
}
