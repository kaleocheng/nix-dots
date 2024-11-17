{ pkgs, config, ... }:
let
  sshKeysDir = ../../config/ssh/keys;
  sshUtils = import ../../lib/ssh.nix { };
in
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    ../../nixos/flavors/server
    ../../nixos/features/service/nginx.nix
  ];

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
    ports = [ 22 ];
  };
  users.users.root = {
    openssh.authorizedKeys.keys = sshUtils.readPubKeys sshKeysDir;
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;

  system.stateVersion = "24.11";
}
