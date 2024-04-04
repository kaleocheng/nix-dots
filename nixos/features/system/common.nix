{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dig
    unzip
  ];
}
