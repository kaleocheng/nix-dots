
{ config, pkgs, ... }:
let ifGroupsExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.kaleo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]
      ++ ifGroupsExist ["docker" "networkmanager"];
    openssh.authorizedKeys.keys  = [
      (builtins.readFile ../../../config/ssh/keys/fakekey.pub)
    ];
  };
}

