{pkgs, ...}: {
  environment.systemPackages = with pkgs;[plank];
  services.bamf.enable = true;
}
