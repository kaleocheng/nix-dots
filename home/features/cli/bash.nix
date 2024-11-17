{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    historyIgnore = [
      "ls"
      "exit"
    ];
    sessionVariables = {
      ANSIBLE_VAULT_PASSWORD_FILE = ".vault_password";
    };
    shellAliases = {
      cat = "bat --style=plain --paging=never";
      hmbuild = "home-manager switch";
      nixbuild = "sudo nixos-rebuild switch";
    };
  };
}
