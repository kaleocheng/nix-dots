{ pkgs, lib, stdenv, ... }: {
  imports = [
      ./conky.nix
      ./rofi.nix
      ./kitty.nix
      ./vscode.nix
      ./picom.nix
      ./terminator.nix
      ./cool-retro-term.nix
    ];
  manual.html.enable = true;
}
