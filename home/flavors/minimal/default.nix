{ pkgs, lib, ... }:
{
  imports = [
    ../../features/cli/vim.nix
    ../../features/cli/autojump.nix
    ../../features/cli/bash.nix
    ../../features/cli/bat.nix
    ../../features/cli/common.nix
    ../../features/cli/fzf.nix
    ../../features/cli/git.nix
    ../../features/cli/jq.nix
    ../../features/cli/lsd.nix
    ../../features/cli/powerline-go.nix
    ../../features/cli/ssh.nix
    ../../features/cli/ripgrep.nix
    ../../features/cli/home-manager.nix
    ../../features/cli/zip.nix
    ../../features/cli/wireguard.nix
  ];
  manual.html.enable = true;
}
