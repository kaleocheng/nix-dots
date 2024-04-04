{pkgs, ...}: {
  ############################
  # iOS devices
  services.usbmuxd.enable = true;

  ############################
  # Bluetooth devices
  hardware.bluetooth.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  services.blueman.enable = true;

  ############################
  # Sound devices
  #sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs;[
    pavucontrol # for pipewire system tray
    xfce.xfce4-pulseaudio-plugin
    libimobiledevice ifuse # mount iOS devices
  ];
}
