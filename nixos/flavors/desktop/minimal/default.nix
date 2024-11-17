{ pkgs, ... }:
{
  imports = [
    ../../minimal
  ];

  i18n.inputMethod = {
    type = "ibus";
    enable = true;
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };

  environment.systemPackages = with pkgs; [
    firefox
  ];
}
