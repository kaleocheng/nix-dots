let
  users = import ./users.nix;
in
{
  workstation = {
    hostname = "workstation";
    dir = "desktop-nixos-workstation";
    arch = "x86_64-linux";
    user = users.default;
  };
  work = {
    hostname = "work";
    dir = "laptop-macos-work";
    arch = "aarch64-darwin";
    user = users.work;
  };
  aha = {
    hostname = "aha";
    dir = "laptop-nixos-aha";
    arch = "x86_64-linux";
    user = users.default;
  };
  wsl = {
    hostname = "windows";
    dir = "laptop-wsl-windows";
    arch = "x86_64-linux";
    user = users.default;
  };
  gateway = {
    hostname = "gateway";
    dir = "server-nixos-gateway";
    arch = "x86_64-linux";
    user = users.default;
  };
}
