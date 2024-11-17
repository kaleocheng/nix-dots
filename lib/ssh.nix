{ }:
{
  # read all .pub files in the path directory
  # return a list of string
  readPubKeys =
    path:
    let
      files = builtins.attrNames (builtins.readDir path);
      pubFiles = builtins.filter (file: builtins.match ".*\\.pub$" file != null) files;
    in
    map (file: builtins.readFile "${path}/${file}") pubFiles;
}
