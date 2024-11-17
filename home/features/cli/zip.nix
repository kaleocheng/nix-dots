{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zip
    p7zip
  ];
}
