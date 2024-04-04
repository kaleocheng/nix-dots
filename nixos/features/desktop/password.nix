{pkgs, ...}: {
  services.gnome = {
    gnome-keyring.enable = true;
  };

  environment.systemPackages = with pkgs; [
    _1password-gui
    bitwarden
  ];
}
