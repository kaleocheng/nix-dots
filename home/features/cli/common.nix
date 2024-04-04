{pkgs, lib, ...}: {
  home.packages = with pkgs; [
    neofetch cmatrix
    coreutils
    file
    zip p7zip
    wget inetutils tcpdump wireguard-tools nmap
    bottom
    htop iftop
    pstree tree ncdu
    pwgen
    mosh
    screen
    qrencode
    (lib.mkIf stdenv.isLinux parted)
    (lib.mkIf stdenv.isLinux openconnect)
  ];
}
