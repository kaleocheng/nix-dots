{pkgs, ...}:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };
  environment.systemPackages = with pkgs;[
    xfce.xfce4-clipman-plugin
    xfce.xfce4-pulseaudio-plugin
  ];

  networking.networkmanager.enable = true;
}
