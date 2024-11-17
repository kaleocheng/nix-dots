{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake
  ];
}
