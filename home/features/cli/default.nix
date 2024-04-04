{ pkgs, lib, stdenv, ... }: {
  imports = [
      ./vim.nix
      ./autojump.nix
      ./bash.nix
      ./bat.nix
      ./common.nix
      ./fzf.nix
      ./git.nix
      ./jq.nix
      ./lsd.nix
      ./powerline-go.nix
      ./ssh.nix
      ./podman.nix
      ./ripgrep.nix
    ];
  programs.home-manager.enable = true;
  manual.manpages.enable = true;
  news.display = "show";
}
