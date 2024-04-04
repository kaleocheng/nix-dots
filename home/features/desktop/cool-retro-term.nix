{pkgs, lib, ...}: {
  home.packages = with pkgs; [
    (lib.mkIf stdenv.isLinux cool-retro-term)
  ];
}
