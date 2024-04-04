#!/usr/bin/env bash

source "uname.sh"

src="$HOME/nix-dots"
if [ "$linux_os" = "nixos" ]
then
    dst="/etc/nixos"
    sudo ln -sfn "$src/flake.nix" "$dst/flake.nix"
    sudo ln -sfn "$src/flake.lock" "$dst/flake.lock"
    sudo ln -sfn "$src/hosts" "$dst/hosts"
    sudo ln -sfn "$src/modules" "$dst/modules"
    sudo ln -sfn "$src/home" "$dst/home"
    sudo ln -sfn "$src/config" "$dst/config"
    sudo ln -sfn "$src/nixos" "$dst/nixos"
    sudo ln -sfn "$src/pkgs" "$dst/pkgs"
else
    dst="$HOME/.config/home-manager"
    mkdir -p "$dst"
    ln -sfn "$src/flake.nix" "$dst/flake.nix"
    ln -sfn "$src/flake.lock" "$dst/flake.lock"
    ln -sfn "$src/hosts" "$dst/hosts"
    ln -sfn "$src/modules" "$dst/modules"
    ln -sfn "$src/home" "$dst/home"
    ln -sfn "$src/config" "$dst/config"
    ln -sfn "$src/nixos" "$dst/nixos"
    ln -sfn "$src/pkgs" "$dst/pkgs"
fi
echo "generated soft links to $dst"
