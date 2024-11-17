{ pkgs, lib, ... }:
{
  home.packages =
    with pkgs;
    [
      neofetch
      coreutils
      file
      restic
      wget
      inetutils
      tcpdump
      nmap
      htop
      iftop
      pstree
      tree
      ncdu
      pwgen
      screen
    ]
    ++ mkLinuxOnly [
      parted
      bottom
    ];
}
