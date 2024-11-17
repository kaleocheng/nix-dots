{ config, pkgs, ... }:

let
  users = import ../../../config/users.nix;

  sshKeysDir = ../../../config/ssh/keys; # No trailing slash here
  sshUtils = import ../../../lib/ssh.nix { };

  # Filtering function to check if groups exist
  ifGroupsExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;

in
{
  security = {
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  users.users.${users.default} = {
    isNormalUser = true;
    extraGroups =
      [ "wheel" ]
      ++ ifGroupsExist [
        "docker"
        "networkmanager"
      ];

    # Dynamically read all .pub files from the specified directory
    openssh.authorizedKeys.keys = sshUtils.readPubKeys sshKeysDir;
  };
}
