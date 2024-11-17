{ pkgs, config, ... }:
let
  hosts = import ../../config/hosts.nix;
in
{
  networking.hostName = hosts.gateway.hostname;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
    ];
  };
  services.tailscale.enable = true;
}
