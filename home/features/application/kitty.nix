{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = true;
    font = {
      name = "FiraCode Nerd Font Regular";
      size = 14;
    };
    environment = {
      "GLFW_IM_MODULE" = "ibus";
    };
    settings = {
      remember_window_size = false;
      background_opacity = "0.96";
      initial_window_width = "100c";
      initial_window_height = "25c";
    };

    themeFile = "zenwritten_dark";
    #themeFile = "Spring";
    keybindings = {
      "cmd+enter" = "toggle_fullscreen";
      "cmd+plus" = "change_font_size all +2.0";
      "cmd+minus" = "change_font_size all -2.0";
      "cmd+c" = "copy_to_clipboard";
      "cmd+v" = "paste_from_clipboard";
      "cmd+t" = "new_os_window";
      "ctrl+t" = "new_tab";
      "cmd+w" = "close_tab";
      "alt+tab" = "next_tab";
      "alt+shift+tab" = "previous_tab";
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
    };
  };
}
