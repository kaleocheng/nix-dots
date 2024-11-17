{ pkgs, ... }:
{
  home.packages = [
    pkgs.poetry
    pkgs.pyenv
    (pkgs.python3.withPackages (
      ps: with ps; [
        pyyaml
        requests
      ]
    ))
  ];
  programs.pylint = {
    enable = true;
  };
}
