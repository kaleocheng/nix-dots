{ pkgs, config, ... }:
{
  home.file.".config/menus/xfce-applications.menu".source = (
    config.lib.file.mkOutOfStoreSymlink ../../../config/xfce/xfce-applications.menu
  );

  home.packages = with pkgs; [
    menulibre
  ];

  xfconf.settings = {
    xfce4-desktop = {
      "desktop-icons/style" = 0;
      "desktop-menu/show-icons" = false;
    };

    xfwm4 = {
      "general/theme" = "Default";
      "general/workspace_count" = 3;
      "general/title_font" = "WenQuanYi Micro Hei 9";
    };

    xfce4-panel = {
      "panels" = [ 1 ];
      "panels/dark-mode" = true;

      "panels/panel-1/position" = "p=6;x=0;y=0";
      "panels/panel-1/length" = 100;
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/span-monitors" = true;
      "panels/panel-1/output-name" = "Automatic";
      "panels/panel-1/size" = 22;
      "panels/panel-1/plugin-ids" = [
        1
        2
        3
        4
        5
        6
        7
        8
        9
      ];

      "plugins/plugin-1" = "tasklist";
      "plugins/plugin-1/show-labels" = true;
      "plugins/plugin-1/flat-buttons" = true;
      "plugins/plugin-1/show-handle" = false;
      "plugins/plugin-1/grouping" = true;
      "plugins/plugin-1/sort-order" = 0;

      "plugins/plugin-2" = "separator";
      "plugins/plugin-2/expand" = true;
      "plugins/plugin-2/style" = 0;

      "plugins/plugin-3" = "pager";
      "plugins/plugin-3/rows" = 1;

      "plugins/plugin-4" = "netload";
      "plugins/plugin-5" = "pulseaudio";

      "plugins/plugin-6" = "systray";
      "plugins/plugin-6/icon-size" = 0; # adjust size automatically

      "plugins/plugin-7" = "clock";
      "plugins/plugin-7/digital-time-format" = "%m-%d %H:%M %a";
      "plugins/plugin-7/digital-layout" = 3;
      "plugins/plugin-7/digital-time-font" = "FiraCode Nerd Font 10";

      "plugins/plugin-8" = "xfce4-clipman-plugin";

      "plugins/plugin-9" = "actions";
      "plugins/plugin-9/items" = [
        "+lock-screen"
        "+shutdown"
        "+logout"
        "+hibernate"
        "+restart"
      ];
    };

    xfce4-power-manager = {
      "xfce4-power-manager/show-tray-icon" = true;
    };

    xfce4-session = {
      "general/SaveOnExit" = false;
    };
    xfce4-keyboard-shortcuts = {
      "commands/custom/override" = true;
      "commands/custom/<Super>space" = "xfce4-popup-applicationsmenu";
      "commands/custom/<Super>t" = "exo-open --launch TerminalEmulator";
      "commands/custom/<Super>r" = "rofi -show combi";
      "commands/custom/<Primary><Super><Shift>dollar" = "xfce4-screenshooter -c -r";

      "xfwm4/custom/override" = true;
      "xfwm4/custom/<Super>Return" = "maximize_window_key";
      "xfwm4/custom/<Shift><Super>Return" = "fullscreen_key";
      "xfwm4/custom/<Super>h" = "left_workspace_key";
      "xfwm4/custom/<Super>l" = "right_workspace_key";
      "xfwm4/custom/<Super>1" = "workspace_1_key";
      "xfwm4/custom/<Super>2" = "workspace_2_key";
      "xfwm4/custom/<Super>3" = "workspace_3_key";
      "xfwm4/custom/<Super>4" = "workspace_4_key";
      "xfwm4/custom/<Super>w" = "close_window_key";
      "xfwm4/custom/<Super>Tab" = "cycle_windows_key";
      "xfwm4/custom/<Alt>Tab" = "switch_window_key";
    };
  };
}
