{ pkgs, lib, ... }:
{
  imports = [
    ../../../features/cli/podman.nix
    ../../../features/development/build.nix
    ../../../features/development/lua.nix
    ../../../features/development/nodejs.nix
    ../../../features/development/python.nix
    ../../../features/development/go.nix
    ../../../features/development/devops.nix
    ../../../features/application/vscode.nix
  ];
  home.packages =
    with pkgs;
    [
      d2
    ]
    ++ mkLinuxOnly [
      code-cursor
    ];
}
