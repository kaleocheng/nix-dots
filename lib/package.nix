{ lib, pkgs }:
{
  mkLinuxOnly = packages: map (package: lib.mkIf pkgs.stdenv.isLinux package) packages;
}
