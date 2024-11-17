{ pkgs, ... }:
{
  imports = [
    ../minimal
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.proxy-switcher
    gnomeExtensions.tailscale-status
    gnomeExtensions.appindicator
  ];

  services.printing.enable = true;
}
