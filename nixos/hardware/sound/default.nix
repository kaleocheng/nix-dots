{ pkgs, ... }:
{
  security.rtkit.enable = true; # avoid the high CPU issue
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol # for pipewire system tray
    xfce.xfce4-pulseaudio-plugin
  ];
}
