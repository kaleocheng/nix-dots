{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = (builtins.readFile ../../../config/ssh/config);
  };
}
