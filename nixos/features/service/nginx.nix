{
  config,
  pkgs,
  lib,
  ...
}:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "acme@example.com";
  };

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
  };
}
