{pkgs, ...}: {
  environment.systemPackages = with pkgs;[
    firefox #broswer
    google-chrome
  ];
}
