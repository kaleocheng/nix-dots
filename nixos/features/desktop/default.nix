{ pkgs, ... }: {
  imports = [
    ./devices.nix
    ./dock.nix
    ./file.nix
    ./input.nix
    ./xserver.nix
    ./web.nix
    ./password.nix
    ./fonts.nix
  ];
}
