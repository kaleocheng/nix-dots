{ writeShellScriptBin, git }:
writeShellScriptBin "gm" ''
  message="$*"
  ${git}/bin/git commit -m "$message"
''
