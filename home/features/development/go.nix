{ pkgs, ... }:
{
  programs.go = {
    enable = true;
  };
  home.packages = with pkgs; [
    gopls
  ];
}
