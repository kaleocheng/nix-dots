{ pkgs, ... }:
{
  services.conky = {
    enable = pkgs.stdenv.isLinux;
    extraConfig = (builtins.readFile ../../../config/conky/conky.conf);
  };
}
