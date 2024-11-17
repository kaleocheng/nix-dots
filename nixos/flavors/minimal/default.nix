{ pkgs, ... }:
{
  imports = [
    ../../features/system/basic.nix
    ../../features/system/nix.nix
    ../../features/system/users.nix
  ];
}
