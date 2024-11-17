{
  config,
  pkgs,
  lib,
  ...
}:

let
  hosts = import ../../config/hosts.nix;
in

with pkgs;
{
  networking.hostName = hosts.aha.hostname;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    ports = [ 40022 ];
  };
}
