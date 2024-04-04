{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    d2
  ];
}
