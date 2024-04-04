{pkgs, ...}: {
  programs.git = {
    enable = true;
    userEmail = "kaleo@xxx.xxx";
    userName = "Kaleo";

    aliases = {
      co = "checkout";
      br = "branch";
    };

    extraConfig = {
      core = {
        quotePath = false;
        precomposeunicode = true;
      };
      push = {
        autoSetupRemote = true;
      };
    };

    ignores = [
      ".DS_Store"
      "*.swp"
    ];

    delta.enable = true;
    lfs.enable = true;
  };

  home.packages = [
    (pkgs.callPackage ../../../pkgs/gm.nix {})
  ];
}
