{ pkgs, lib, ... }:
{
  imports = [
    ../minimal
  ];

  programs.bash.shellAliases.open = "nautilus 2> /dev/null";
}
