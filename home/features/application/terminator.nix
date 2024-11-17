{ pkgs, ... }:
{
  programs.terminator = {
    enable = pkgs.stdenv.isLinux;
    config = {
      global_config.title_transmit_bg_color = "#000000";
      global_config.title_inactive_bg_color = "#000000";
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

      profiles.default.background_color = "#2e3436";
      profiles.default.background_darkness = 0.83;
      profiles.default.background_type = "transparent";
      profiles.default.color_scheme = "custom";
      profiles.default.cursor_color = "#d8d8d8";
      profiles.default.font = "Monospace 10";
      profiles.default.foreground_color = "#d8d8d8";
      profiles.default.show_titlebar = false;
      profiles.default.scrollbar_position = "hidden";
      profiles.default.scrollback_lines = 5000;
      profiles.default.scrollback_infinite = true;
      profiles.default.palette = "#000000:#cc0000:#4e9a06:#c4a000:#3465a4:#75507b:#06989a:#d3d7cf:#555753:#ef2929:#8ae234:#fce94f:#729fcf:#ad7fa8:#34e2e2:#eeeeec";
      profiles.default.use_system_font = false;
      profiles.default.bold_is_bright = true;

      layouts.default.window0.type = "Window";
      layouts.default.window0.parent = "";
      layouts.default.child1.type = "Terminal";
      layouts.default.child1.parent = "window0";
    };
  };
}
