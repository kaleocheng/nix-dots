{
  programs.bash = {
    enable = true;
    historyIgnore = ["ls" "exit"];
    shellAliases = {
      gs = "git status";
      gd = "git diff";
      gdc = "git diff --cached";
      ga = "git add . -p";
      gp = "git push";
      hmbuild = "home-manager switch";
      nixbuild = "sudo nixos-rebuild switch";
      nixupdate = "nix flake  update --commit-lock-file  ~/dotfiles";
    };
  };
}

