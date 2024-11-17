{ pkgs, ... }:
{
  imports = [
    ../minimal
    ../../../hardware/bluetooth
    ../../../hardware/sound
    ../../../hardware/mobile
  ];

  services.gnome = {
    gnome-keyring.enable = true;
  };

  services.bamf.enable = true; # for dock app like plank

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xfce.xfce4-clipman-plugin
    xfce.xfce4-pulseaudio-plugin
  ];

  programs.file-roller.enable = true;
  programs.thunar.plugins = with pkgs; [
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.xfce4-sensors-plugin
    xfce.xfce4-netload-plugin
  ];

  networking.networkmanager.enable = true;
}
