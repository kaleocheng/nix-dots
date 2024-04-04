{
  imports = [ ./virtualisation.nix ];
  programs.vim.defaultEditor = true;
  programs.ssh.startAgent = true;
}
