{ pkgs, ... }:
{
  programs.vscode = {
    enable = pkgs.stdenv.isLinux;
  };
}
