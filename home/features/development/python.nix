{pkgs, ...}: {
  home.packages = [ (pkgs.python3.withPackages(ps: with ps; [ pyyaml requests ])) ];
  programs.pylint = {
    enable = true;
  };
}
