{pkgs, ...}: {
  programs.terminator = {
    enable = pkgs.stdenv.isLinux;
    config = {
      global_config.enabled_plugins = "LaunchpadBugURLHandler, LaunchpadCodeURLHandler, APTURLHandler, CustomCommandsMenu";
      keybindings.zoom_in = "<Super>equal";
      keybindings.zoom_out = "<Super>minus";
      keybindings.new_tab = "<Primary>t";
      keybindings.close_term = "<Super>w";
      keybindings.copy = "<Super>c";
      keybindings.paste = "<Super>v";
      keybindings.search = "<Super>f";
      keybindings.next_tab = "<Alt>Tab";
      keybindings.switch_to_tab_1 = "<Alt>1";
      keybindings.switch_to_tab_2 = "<Alt>2";
      keybindings.switch_to_tab_3 = "<Alt>3";
      keybindings.switch_to_tab_4 = "<Alt>4";
      keybindings.switch_to_tab_5 = "<Alt>5";
      keybindings.switch_to_tab_6 = "<Alt>6";
      keybindings.switch_to_tab_7 = "<Alt>7";
      keybindings.switch_to_tab_8 = "<Alt>8";
      keybindings.switch_to_tab_9 = "<Alt>9";
      profiles.default.background_darkness = 0.9;
      profiles.default.background_type = "transparent";
      profiles.default.use_system_font = false;
      profiles.default.font = "FiraCode Nerd Font Regular 12";
      profiles.default.show_titlebar = false;
      profiles.default.use_theme_colors = true;
      layouts.default.window0.type = "Window";
      layouts.default.window0.parent = "";
      layouts.default.child1.type = "Terminal";
      layouts.default.child1.parent = "window0";
    };
  };
}
