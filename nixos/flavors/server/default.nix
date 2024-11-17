{ pkgs, ... }:
{
  imports = [
    ../minimal
  ];
  services.prometheus.exporters = {
    node = {
      enable = true;
      enabledCollectors = [
        "systemd"
        "zfs"
      ];
    };
  };
}
