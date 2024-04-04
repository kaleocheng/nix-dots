{config, pkgs, ...}: {
  imports = [
    ../../home/features/fonts
    ../../home/features/cli
    ../../home/features/desktop/rofi.nix
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home = {
    username = "kaleo";
    homeDirectory = "/home/kaleo";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
}

