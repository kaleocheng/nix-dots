{pkgs, ...}: {
  imports = [
      ../../../modules/services/conky
  ];
  services.conky = {
    enable = pkgs.stdenv.isLinux;
    settings = (builtins.readFile ../../../config/conky/conky.conf);
  };
}
