{config, pkgs, ...}: {
  imports = [
    ../../home/features/fonts
    ../../home/features/cli
    ../../home/features/development
    ../../home/features/desktop
  ];

  home = {
    username = "kaleo";
    homeDirectory = "/Users/kaleo";
    stateVersion = "24.05";
    sessionPath = [
      "/opt/homebrew/bin"
    ];
    sessionVariables = {
      SHELL = "/opt/homebrew/bin/bash";
    };
  };
}

