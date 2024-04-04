{config, pkgs, ...}: {
  imports = [
    ../../home/features/fonts
    ../../home/features/cli
    ../../home/features/development
    ../../home/features/desktop
    ../../home/features/desktop/xfce.nix
  ];

  home = {
    username = "kaleo";
    homeDirectory = "/home/kaleo";
    stateVersion = "24.05";
  };

}

