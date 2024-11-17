{ config, pkgs, ... }:
let
  hosts = import ../../config/hosts.nix;
in

{
  networking.hostName = hosts.workstation.hostname;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    ports = [ 22 ];
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
  };
}
