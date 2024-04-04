`config` includes all static configuration files.

usually it's used by `builtins.readFile` function in nix files. e.g.

```
{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = (builtins.readFile ../../../config/ssh/config);
  };
}
```
