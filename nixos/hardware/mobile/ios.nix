{ pkgs, ... }:
{
  # iOS devices
  services.usbmuxd.enable = true;
  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # mount iOS devices
  ];
}
