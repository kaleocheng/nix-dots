{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.utf8";
    LC_IDENTIFICATION = "zh_CN.utf8";
    LC_MEASUREMENT = "zh_CN.utf8";
    LC_MONETARY = "zh_CN.utf8";
    LC_NAME = "zh_CN.utf8";
    LC_NUMERIC = "zh_CN.utf8";
    LC_PAPER = "zh_CN.utf8";
    LC_TELEPHONE = "zh_CN.utf8";
    LC_TIME = "zh_CN.utf8";
  };

  # coommon packages
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    dig
    neofetch
    htop
    iftop
    tcpdump
    inetutils
    bottom
    pstree
    tree
    pwgen
    screen
    ncdu
    parted
    file
    unzip
    lshw
  ];

  # install at leaset one Chinese font
  fonts.packages = with pkgs; [
    wqy_microhei
  ];
}
