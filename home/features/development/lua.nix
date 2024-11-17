{ pkgs, ... }:
{
  home.packages = with pkgs; [ lua ];
}
