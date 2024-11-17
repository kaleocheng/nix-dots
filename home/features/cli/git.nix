{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "k@example.com";
    userName = "k";

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

  programs.bash.shellAliases = {
    gs = "git status";
    gd = "git diff";
    gdc = "git diff --cached";
    ga = "git add . -p";
    gp = "git push";
  };

  home.packages = [
    (pkgs.callPackage ../../../pkgs/gm.nix { })
  ];
}
