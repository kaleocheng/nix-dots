{ pkgs, ... }: {
  imports = [
    ./prometheus-exporter.nix
  ];
}
