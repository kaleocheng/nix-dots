(final: prev: {
  # Inject the functions directly into pkgs for convenience
  # you can use it in other nix files with pkgs.mkLinuxOnly
  mkLinuxOnly =
    (import ../lib/package.nix {
      lib = final.lib;
      pkgs = final.pkgs;
    }).mkLinuxOnly;
})
