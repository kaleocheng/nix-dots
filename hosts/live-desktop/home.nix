{ pkgs, ... }: {
  imports = [
    ../../home/features/cli
    ../../home/features/desktop/xfce.nix
  ];


  home = {
    username = "kaleo";
    homeDirectory = "/home/kaleo";
    file."dotfiles".source = ../../.;
    stateVersion = "24.05";
  };
}


