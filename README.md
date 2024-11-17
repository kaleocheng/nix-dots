# Managing Dotfiles with Nix

Managing dotfiles across different systems can be tricky. This repo demonstrates how to use Nix ( with flake ) to handle dotfiles in a way that's easy to manage and works on various systems like NixOS, macOS, and Windows Subsystem for Linux (WSL).

## Why Use Nix?

Nix offers a different way to manage software and system settings. It provides:

- **Consistency**: Keeps your settings the same across all your systems.
- **No Conflicts**: Avoids issues with different software versions.
- **Flexibility**: Lets you organize settings into parts you can reuse.

And the most important thing: you can leverage the biggest reuseable configuration repository in the world: [Nixpkgs](https://github.com/NixOS/nixpkgs) to make your life easier. E.g. to setup a self-hosted Jellyfin server, maybe all you need to do is add this to your configuration:

```nix
services.jellyfin.enable = true;
```

## How the Repository is Organized

Here's how it's laid out:

### `flake.nix`

`flake.nix` is the entry point of this repo, it loads configuration for each host from `hosts/*`.

### `config/`

This folder has static settings for apps like SSH and Vim. And we will use Nix function `builtins.readFile` read these files and use them in our configuration whenever needed.

### `home/`

Home-manager settings are split into:

- **`features/`**: Modules for tools and apps. For example, we put `git` settings in `features/cli/git.nix`, and `vscode` settings in `features/application/vscode.nix`.
- **`flavors/`**: Pre-made setups like minimal or development environments, usually it's a combination of `features`.

### `hosts/`

Settings specific to each device/system are here. It's the entry point for each host, you will put your own hosts in here but let me show you some examples:

- **`desktop-nixos-workstation/`**: Main setup for a NixOS desktop.
- **`laptop-macos-work/`**: MacBook setup using home-manager.
- **`laptop-nixos-aha/`**: NixOS laptop setup.
- **`laptop-wsl-windows/`**: WSL setup using home-manager.
- **`server-nixos-gateway/`**: NixOS server setup.

### `lib/`

Common Nix functions and tools are here, which you can use in different settings.

I provide a simple SSH function to read all `.pub` files in a directory and return them as a list of strings.

### `nixos/`

NixOS-specific settings, it's similar to `home/` for home-manager, but this is for NixOS only:

- **`features/`**: Individual NixOS features like services/applicatoins/cli.
- **`flavors/`**: Pre-made NixOS setups for different needs, usually it's a combination of `features` + some settings for specific needs.
- **`hardware/`**: Settings for specific hardware like GPUs.
- **`modules/`**: Custom NixOS modules for extra features.

### `overlays/`

Custom package overlays for Nixpkgs.

e.g. I added a new function `mkLinuxOnly` to `pkgs` so I can import Linux-only packages easily with `pkgs.mkLinuxOnly [ linux-only-package ]`.

### `pkgs/`

This folder has custom package definitions for software not in the standard Nix repositories.

## How I'm Using This

I'm using this structure to manage most of my devices which include x86 desktops/laptops, Windows WSL, Apple Silicon Macs, x86 servers, etc. there is usually what I do:

### First Setup Only

1. Install NixOS or nix + standalone Home-Manager for non-NixOS. Enable flake.
2. Clone this repository.
3. add new hosts to `hosts/*` and adjust the settings.
4. Run the installation script:
   ```bash
   ./install.sh
   ```

### For NixOS Devices

just run `nixos-rebuild switch` to apply the configuration.

### For Non-NixOS Devices

run `home-manager switch` to apply the configuration.

---

I really hope this guide helps you manage your dotfiles or organize your nix configuration more easily. Happy Nixing!
